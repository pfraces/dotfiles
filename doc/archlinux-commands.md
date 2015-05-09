Archlinux commands
==================

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
