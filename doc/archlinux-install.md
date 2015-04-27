Archlinux install
=================

CPU architecture
----------------

```
cat /proc/cpuinfo | sed -nr 's/.*(lm).*/\1/p' | sed 1q |
  test $(cat) == 'lm' && echo 'x86_64' || echo 'i686'
```

Get the ISO
-----------

*   http://www.archlinux.org/download/

Choose the proper **netinstall** ISO based on the CPU architecture

Installation
------------

*   https://wiki.archlinux.org/index.php/installation_guide
*   https://wiki.archlinux.org/index.php/Beginners'_guide
*   https://github.com/helmuthdu/aui

Mailing lists
-------------

*   https://mailman.archlinux.org/mailman/listinfo/arch-announce

Setup pacman
------------

```
wget --no-check-certificate -q -O - \
  "https://www.archlinux.org/mirrorlist/?country=ES&protocol=http&ip_version=4" |
  sed -n '/^#Server/ s/^#//' |
  tee /etc/pacman.d/mirrorlist

pacman -Syy
pacman -S --noconfirm pacman
pacman-key --init
pacman-key --populate archlinux
```

Install sudo
------------

    pacman -S --noconfirm sudo

Add users
---------

```
useradd -m -g users \
  -G audio,optical,power,storage,wheel \
  -s /bin/bash \
  pfraces
```

### Set passwords

    passwd root
    passwd pfraces

Switch to a non-privileged user
-------------------------------

    exit

Initial system update
---------------------

### Install reflector

    sudo pacman -S --noconfirm reflector

### Install packer

```
sudo pacman -S --noconfirm base-devel wget jshon expac
mkdir -p ~/.build/packer
cd ~/.build/packer
wget https://aur.archlinux.org/packages/pa/packer/PKGBUILD 
makepkg
sudo pacman -U packer-*.pkg.tar.xz
```

### System update

```
sudo reflector --verbose -l 3 --sort rate --save /etc/pacman.d/mirrorlist
sudo packer -Syu --noconfirm
```

**TIP:** Save the previous commands in an executable script for further usage
