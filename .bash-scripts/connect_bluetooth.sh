# disconnect my onepule headphones
bluetoothctl disconnect B0:A3:F2:55:6A:09

# reset the bluetooth
bluetoothctl power off && bluetoothctl power on

# list all Bluetooth devices
bluetoothctl scan on && bluetoothctl devices

# if possible try to connect to my paired device
bluetoothctl connect B0:A3:F2:55:6A:09
