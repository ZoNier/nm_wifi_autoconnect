# NetworkManager Wi-Fi AutoConnect

This script automatically configures and connects to a Wi-Fi network on a Linux system using NetworkManager. It checks the network availability and sets up the Wi-Fi connection if the network is unavailable.

## Prerequisites

- `nmcli` command-line tool (part of NetworkManager)
- Bash shell

## Installation

1. Clone this repository or download the `nm_wifi_autoconnect.sh` script.

    ```sh
    git clone https://github.com/ZoNier/nm_wifi_autoconnect
    cd nm_wifi_autoconnect
    nano nm_wifi_autoconnect.sh
    sudo mv nm_wifi_autoconnect.sh /opt
    ```

2. Make the script executable:

    ```sh
    sudo chmod +x /opt/nm_wifi_autoconnect.sh
    ```

3. Add a cron job to run the script every 5 minutes:

    ```sh
    sudo crontab -e
    ```

    Add the following line to the crontab file:

    ```sh
    */5 * * * * /opt/nm_wifi_autoconnect.sh
    ```

## Configuration

Edit the script to change the following variables according to your Wi-Fi network settings:

- `SSID:` The SSID of your Wi-Fi network.
- `PASSWORD:` The password of your Wi-Fi network.
- `BSSID:` The BSSID (MAC address) of your Wi-Fi network.
- `STATIC_IP:` The static IP address you want to assign.
- `GATEWAY:` The gateway IP address.
- `DNS:` The DNS server IP address.
- `PING_TARGET:` The target IP address to check network availability.

## How It Works

1. The script first checks if the network is available by ping the target IP address.
2. If the network is available, the script exits.
3. If the network is unavailable, the script configures the Wi-Fi settings using `nmcli`.
4. After configuring the Wi-Fi, the script checks the network availability again and prints the result.

## License

This project is licensed under the [MIT License](LICENSE).

## Additional Notes for ArchLinux Users

If you are using ArchLinux, you will need to install `cronie` since ArchLinux uses `systemd/timers` by default.

```sh
pacman -Syu cronie
systemctl enable --now cronie.service
