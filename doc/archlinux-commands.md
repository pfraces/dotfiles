Archlinux commands
==================

Users management
----------------

### Add user

```
useradd -m -g users \
  -G audio,optical,power,storage,wheel \
  -s /bin/bash \
  pfraces
```

### Update user groups

```
usermod -g users \
  -G audio,optical,power,storage,wheel \
  pfraces
```

### Delete user

    userdel -r pfraces

# lanzar otra consola gráfica

    $ startx -- :1 vt8

# crear iso de un cd

    $ sudo wodim -v -speed=2 -dev='/dev/scd0' source.iso
    $ wodim -devices
    $ wodim -scanbus | grep RW | awk '{print $1}'

# reporiducir dvd

    $ mplayer dvd://<numero de capitulo> -dvd-device /dev/sr0

`/dev/cdrom` es un enlace simbolico a `/dev/sr0`. se puede crear otro que se
llame `/dev/dvd`. **mplayer** buscara por defecto en `/dev/dvd`

    $ mplayer dvd://1
    
# convertir a dvd

    $ ffmpeg -i input.mp4 -c copy -bsf h264_mp4toannexb output.ts

# qemu

    $ qemu-img create -f qcow2 hd.qcow 700M
    $ qemu-system-x86_64 -cdrom file.iso -boot d hd.qcow

# hacer backups

    $ cd $HOME
    $ sudo tar czhf backup.laptop.tar.gz --exclude="distro/*" dev/ doc/

# montar usb

    $ sudo mount /dev/disk/by-label/ZIP\\x20ZIP /mnt/storage/
    $ sudo mount /dev/cdrom /mnt/storage/
    $ sudo umount /mnt/storage/

# montar andriod

    $ sudo mount /dev/sdb /mnt/storage -t vfat

El comando anterior tira error pero es necesario para que se cree el nodo
`/dev/sdb1`, el cual si podemos montar con:

    $ sudo mount /dev/sdb1 /mnt/storage -t vfat

Al pasar ficheros, desconectar desde el terminal antes de desconectar el usb

# levantar la wifi

    $ ip link set wlan0 up
    $ iwconfig wlan0 essid 'my-essid' key 's:my-key'
    $ dhcpcd wlan0

# multihead

    xrandr \
        # laptop
        --output LVDS-1 --auto --pos 0x0 \

        # hdmi main
        --output HDMI-0 --auto --pos 0x0 \

        # vga
        --output VGA-1 --auto --right-of LVDS-1

        # dvi
        --output DVI-0 --auto --left-of HDMI-0 \
        --output DVI-1 --auto --right-of HDMI-0
