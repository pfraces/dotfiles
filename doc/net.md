# Levantar red cableada con core packages

    $ sudo ip link set <interface> up
    $ dhcpcd <interface>

## Ejemplo

    $ sudo ip link set cable up
    $ dhcpcd cable

## Requiere

*   **dhcpcd**: Proporciona el comando **dhcpcd**

# Levantar red wifi (protegida con WEP) con core packages

    $ sudo ip link set <interface> up
    $ sudo iwconfig <interface> essid '<essid>' key 's:<key>'
    $ dhcpcd <interface>

## Ejemplo

    $ sudo ip link set wifi up
    $ sudo iwconfig wifi essid 'WIFI4460' key 's:my_WEP_password'
    $ dhcpcd wifi

## Requiere

*   **dhcpcd**: Proporciona el comando **dhcpcd**

# Levantar red wifi (protegida con WPA) con core packages

## Requiere

*   **dhcpcd**: Proporciona el comando **dhcpcd**
*   **wireless_tools**: Proporciona el comando **iwconfig**
*   **wpa_supplicant**: Para acceder a puntos de acceso protegidos con wpa

# Levantar wifi con netctl

    $ sudo netctl start <profile>

# Ejemplo

    $ sudo netctl start work
