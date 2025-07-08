#!/bin/bash
#maybe implement a switch for multiple devices and a seperate file for storing them

PHONE_IP="192.168.178.76"
echo "Enter ADB Connect Port:" #Wireless debugging IP
read CONNECT_PORT
echo "Enter ADB Pairing Port:" #Wireless debugging when pairing with pairing code
read PAIR_PORT
echo "Enter pairing code (visible on phone):" #big code on pairing screen
read -s PAIR_CODE

# adb Pair
adb pair $PHONE_IP:$PAIR_PORT <<< "$PAIR_CODE"

# adb Connect
adb connect $PHONE_IP:$CONNECT_PORT

# scrpy command for basic connection change values if your local network cant handle it
scrcpy -s $PHONE_IP:$CONNECT_PORT --video-codec=h265 --video-bit-rate=8M --max-fps=60 --render-driver=opengl
