Community
=========

aurvote
-------

    sudo packer -S --noconfirm aurvote

### configuration

    aurvote --configure

**NOTE:** Aurvote stores an unencrypted password so better if you use directly the AUR page to vote for packages

### list of voted packages

*   https://aur.archlinux.org/packages/?SB=w&SO=d&O=0&PP=50

### vote/unvote

    aurvote --vote <package>
    aurvote --unvote <package>

Also you can vote/unvote from the package's web page (`https://aur.archlinux.org/packages/<package>`) 

Sound
=====

hot-plugging USB soundcard
--------------------------

`/etc/udev/rules.d/00-local.rules`

```
KERNEL=="pcmC[D0-9cp]*", ACTION=="add", PROGRAM="/bin/sh -c 'K=%k; K=$${K#pcmC}; K=$${K%%D*}; echo defaults.ctl.card $$K > /etc/asound.conf; echo defaults.pcm.card $$K >>/etc/asound.conf'"
KERNEL=="pcmC[D0-9cp]*", ACTION=="remove", PROGRAM="/bin/sh -c 'echo defaults.ctl.card 0 > /etc/asound.conf; echo defaults.pcm.card 0 >>/etc/asound.conf'"
```

ALSA sound too quiet
--------------------

`~/.asoundrc`

```
pcm.louder {
	type plug
	slave.pcm "dmix"
	ttable.0.0 4.0
	ttable.1.1 4.0
}

pcm.!default "louder"
```

https://bbs.archlinux.org/viewtopic.php?pid=1089550#p1089550

Media
=====

CD to ISO
---------

    sudo wodim -v -speed=2 -dev='/dev/scd0' source.iso
    wodim -devices
    wodim -scanbus | grep RW | awk '{print $1}'

play DVD
--------

    mplayer dvd://1

`mplayer` looks for a `/dev/dvd` file. It can be linked from `/dev/sr0`

    ln -s /dev/sr0 /dev/dvd
    
MPEG to DVD
-----------

    $ ffmpeg -i input.mp4 -c copy -bsf h264_mp4toannexb output.ts
