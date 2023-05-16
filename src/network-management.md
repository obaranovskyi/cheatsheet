* `ifconfig -a` - Show ip and mac addresses
* `ip addr show` - Show ip mac and other infomation
* `ip -4 a` - Swow only tcp/ip IPv4
* `ip addr` - Show all network interfaces
* `ip -6 a` - Show only tcp/ip IPv6
* `curl -s https://api.ipify.org` - Display public ip address
* `netstat -tulpn` - Show open ports (use sudo to show PID/Program name)
* `netstat -rn | grep -P "default|UG"` - Show router ip address
* `nmcli device wifi list` - Show wifi list
* `nmcli connection show` - Show connected wifi
* `nmcli device wifi connect SSID_or_BSSID password password` - Connect to wifi using NetworkManager
* `lsof -i :8000` - Find process including PID details which runs on port 8000
* `networkctl` - Query the status of network links
* `hostname -I` - Display ip address (Ubuntu)
* `hostname -I | awk '{print }'` - Display ip address on Ubuntu

# Wifi (mostly OSX)
* `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan` - Scan wifi (osx);
* `networksetup -setairportpower en0 on` - Turn on wifi
* `networksetup -setairportpower en0 off` - Turn off wifi
* `networksetup -listallhardwareports` - Find wifi
* `networksetup -setairportnetwork en0 WIFI_SSID_I_WANT_TO_JOIN WIFI_PASSWORD` - Connect to specified wifi
* `speedtest-cli - Speed test
