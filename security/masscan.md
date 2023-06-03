# Install

```
# install clang git gcc make libpcap-dev

# build
git clone https://github.com/robertdavidgraham/masscan
cd masscan && make
chmod +x ./bin/masscan

# on mac
mv ./bin/masscan /usr/local/bin/masscan
```

# Commands
```
masscan 192.168.1.1/24 --top-ports 100
masscan 10.11.0.0/16 -p0-65535 ––rate 1000000
masscan 10.11.0.0/16 -p80,443,8080 ––rate 1000000
masscan 10.11.0.0/16 ‐‐top-ports 100 > results.txt
masscan 10.11.0.0/16 -p22-25

```
