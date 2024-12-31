# Aria2
- https://aria2.github.io/

## Max Speed Torrent download (VPS) - Download 2Gb file in few mins
- aria2.conf
```
seed-time=0
bt-max-peers=200
bt-request-peer-speed-limit=1M
bt-tracker-connect-timeout=5
bt-tracker-interval=20
bt-tracker-timeout=5
max-connection-per-server=16
split=64
min-split-size=1M
seed-ratio=0.0
file-allocation=falloc
enable-dht=true
enable-peer-exchange=true
bt-tracker=udp://tracker.openbittorrent.com:80,udp://tracker.opentrackr.org:1337,udp://tracker.coppersurfer.tk:6969
```

## Speed up download file (local machine)
```
 aria2c -x 16 -s 64 --max-connection-per-server=16 --min-split-size=1M \
--file-allocation=falloc --timeout=10 --connect-timeout=5 https://link.testfile.org/500MB
```
