# My Pi 2W


## Pi Slow

Symptoms:
- The Pi becomes extremely slow, lagging when entering commands via an external keyboard and HDMI monitor
- After 5 to 10 minutes, the SSH connection closes

use `free -h` to check ram

If free memory is your issue:

### Option 1 - enable ZRam
- Zram creates compressed RAM based block storage. This compression allows additional memory inside RAM in exchange for the processing power used for compression. This has the benefit of being faster than using the SD card for swap memory.

- To enable, use `zram-tools`, the default options are fine for the Pi Zero 2w
```
sudo apt install zram-tools
sudo systemctl status zramswap
```

- (optional) increase Pi's tendency to use swap now that we are using Zram. For more information, see source for instructions.

### Option 2 - increase the swap memory (slower, and ZRam was enough for me).

Increasing the swap memory designates a portion of the SD card to act as memory. Using the SD card as memory is slow but reliable. To increase the swap memory:

```bash
free -h
sudo nano /etc/dphys-swapfile #CONF_SWAPSIZE=512
sudo systemctl restart dphys-swapfile
free -h
```

## Lightweight OS: https://dietpi.com/


## Monitor temperator and stats
- `monitor.sh`
```bash
#!/bin/bash

#echo "============="
vcgencmd measure_temp
#vcgencmd get_throttled
#vcgencmd measure_volts
#vcgencmd get_mem arm
#vcgencmd get_mem gpu
echo "============="
```

- `monitor-slack.sh`
```bash
#!/bin/bash

temp=$(vcgencmd measure_temp)
number=$(echo "$temp" | grep -oE '[0-9]+\.[0-9]+')
if (( $(awk 'BEGIN {print ("'"$number"'">55)}') )); then
  log=$(bash /home/pi/tools/monitor.sh)
  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${log}\"}" https://hooks.slack.com/services/T02xxx/xxx
fi
```


## Check info

```bash
$ cat /proc/cpuinfo
$ cat /etc/os-release
PRETTY_NAME="Raspbian GNU/Linux 11 (bullseye)"
NAME="Raspbian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=raspbian
ID_LIKE=debian
HOME_URL="http://www.raspbian.org/"
SUPPORT_URL="http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL="http://www.raspbian.org/RaspbianBugs"
```


## Install NodeJS, and N8N

```bash
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
yarn global add n8n
sudo ufw allow 5678
pm2 start n8n
pm2 startup
pm2 save
pm2 list
```

## Tmux config
- ~/.tmux.conf
```
set -g mouse on
set -g history-limit 5000
```
