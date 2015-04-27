# actualizar sistema

    # pacman -Syu

Ideal lanzarlo cada dia

# reemplazar base de datos con la del mirror

    # pacman -Syy

Ideal después de actualizar el mirrorlist

# buscar paquete

    $ pacman -Ss paquete

# instalar paquete

    # pacman -S paquete

# eliminar paquete y dependencias

    # pacman -Rscn paquete

Elimina el paquete, sus dependencias y ficheros de configuración

# eliminar paquete (pero no sus dependencias)

    # pacman -Rdd paquete

# consultar qué ficheros ha instalado un paquete

    $ pacman -Ql paquete

# consultar qué paquete ha instalado un ejecutable

    $ pacman -Qo $(which ejecutable)
