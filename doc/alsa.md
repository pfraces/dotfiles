# Conexión hot-plugging de una tarjeta de sonido USB

`/etc/udev/rules.d/00-local.rules`

```
KERNEL=="pcmC[D0-9cp]*", ACTION=="add", PROGRAM="/bin/sh -c 'K=%k; K=$${K#pcmC}; K=$${K%%D*}; echo defaults.ctl.card $$K > /etc/asound.conf; echo defaults.pcm.card $$K >>/etc/asound.conf'"
KERNEL=="pcmC[D0-9cp]*", ACTION=="remove", PROGRAM="/bin/sh -c 'echo defaults.ctl.card 0 > /etc/asound.conf; echo defaults.pcm.card 0 >>/etc/asound.conf'"
```

https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture_(Espa%C3%B1ol)#Conexi.C3.B3n_hot-plugging_de_una_tarjeta_de_sonido_USB

# ALSA sound too quiet

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
