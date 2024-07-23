#!/bin/bash

SSID="UniFi"
PASSWORD="Uy0WG0xc"
BSSID="F9:6E:0F:2F:23:56"
STATIC_IP="192.168.1.200"
GATEWAY="192.168.1.1"
DNS="192.168.1.1"
PING_TARGET="1.1.1.1"

# Function to check network availability
check_network() {
    ping -c 1 "$PING_TARGET" > /dev/null 2>&1
    return $?
}

# Check network availability
if check_network; then
    echo "Network is available."
    exit 0
else
    echo "Network is unavailable. Configuring Wi-Fi."
fi

# Connect to Wi-Fi
nmcli device wifi connect "$SSID" password "$PASSWORD" bssid "$BSSID"
nmcli connection modify "$SSID" ipv4.method manual ipv4.addresses "$STATIC_IP/24" ipv4.gateway "$GATEWAY" ipv4.dns "$DNS"
nmcli connection modify "$SSID" connection.autoconnect yes

# Check network availability again after configuration
if check_network; then
    echo "Network successfully configured."
else
    echo "Error: Failed to configure the network. Check your settings."
fi
