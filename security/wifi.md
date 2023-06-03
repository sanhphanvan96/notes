# Install aircrack-ng macos
- https://www.aircrack-ng.org/doku.php?id=install_aircrack#installing_on_mac_osx
```
HOMEBREW_NO_AUTO_UPDATE=1 brew install autoconf automake libtool openssl shtool pkg-config
HOMEBREW_NO_AUTO_UPDATE=1 brew install pcre

wget https://download.aircrack-ng.org/aircrack-ng-1.6.tar.gz
tar -zxvf aircrack-ng-1.6.tar.gz
cd aircrack-ng-1.6
autoreconf -i
./configure --with-experimental
make
make install
```
- Airmon-ng only works on Linux, so on Mac, please use airport instead

```
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
sudo airport -s
```

- https://louisabraham.github.io/articles/WPA-wifi-cracking-MBP.html

What is a WPA attack?
There are 3 steps:

- Identify the target acces point: name (= BSSID), MAC address (= SSID) and channel (~ radio frequency)
- Sniff the channel in monitor mode to retrieve:
    - a beacon (easy)
    - a handshake (= four-way handshake), or some frames of it (hard)
- Crack the password using the dump

What makes the retrieval of the handshake hard is that it appears only when somebody connects to the access point.

The good news is that you can deauthentificate people from the wifi network - it’s called wifi jamming and it’s useful to impress a girl and piss off people at Starbucks. When they reconnect, they re-send the handshake. That adds a Deauth step.

## 1. Scan
```
sudo airport -s
```

## 2. Sniff - The easy way with airport

```
// Ctrl-C to stop capturing
sudo airport en0 sniff $CHANNEL

```

## 3. Convert cap to hccapx using cap2hccapx
- https://hashcat.net/cap2hccapx/