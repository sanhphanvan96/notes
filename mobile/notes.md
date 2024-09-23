```
scrcpy --max-fps 20 --turn-screen-off
```
---

Cheat sheet for **scrcpy**, a tool that allows you to control Android devices from your PC.

### Basic Usage
- **Start scrcpy**:
  ```
  scrcpy
  ```

- **Specify device by serial** (when multiple devices are connected):
  ```
  scrcpy -s <serial_number>
  ```

- **Limit resolution** (to reduce load):
  ```
  scrcpy --max-size 1024
  ```

- **Limit frame rate** (e.g., 15 FPS):
  ```
  scrcpy --max-fps 15
  ```

- **Full-screen mode**:
  ```
  scrcpy --fullscreen
  ```

- **Turn the screen off while mirroring** (device screen will be off):
  ```
  scrcpy --turn-screen-off
  ```

### Screen Recording
- **Record screen while mirroring** (output in MP4 format by default):
  ```
  scrcpy --record file.mp4
  ```

- **Record only (without mirroring)**:
  ```
  scrcpy --no-display --record file.mp4
  ```

### Window Options
- **Set window title**:
  ```
  scrcpy --window-title "My Device"
  ```

- **Start in full-screen**:
  ```
  scrcpy --fullscreen
  ```

- **Stay awake** (keep the device awake while connected):
  ```
  scrcpy --stay-awake
  ```

- **Disable window decorations**:
  ```
  scrcpy --window-borderless
  ```

### Keyboard and Mouse Control
- **Copy text to clipboard**:
  ```
  scrcpy --clipboard-autosync
  ```

- **Paste clipboard (Ctrl + v)**: Press `Ctrl + v` in the scrcpy window to paste from the computer clipboard.

- **Send key event**:
  - **Turn on/off screen**: `Ctrl + o`
  - **Show the power menu**: `Ctrl + p`
  - **Volume up/down**: `Ctrl + ↑ / Ctrl + ↓`
  - **Copy and paste**: `Ctrl + c / Ctrl + v`
  - **Go home**: `Ctrl + h`
  - **Back**: `Ctrl + b`
  - **Overview**: `Ctrl + e`
  - **App switch**: `Ctrl + s`

### Performance Optimization
- **Reduce bit-rate** (for smoother experience over slow connections):
  ```
  scrcpy --bit-rate 2M
  ```

- **Start with lower resolution**:
  ```
  scrcpy --max-size 800
  ```

### Advanced Options
- **TCP/IP mode**:
  1. Connect device via USB, enable TCP/IP mode:
     ```
     adb tcpip 5555
     ```
  2. Disconnect USB and find device IP (can use `adb shell ip route`):
     ```
     scrcpy -s <device_ip>:5555
     ```

- **Crop the screen** (e.g., to show only part of it, useful for foldable phones):
  ```
  scrcpy --crop 1080:1920:0:0
  ```

- **Rotate device screen**:
  ```
  scrcpy --rotation 90
  ```

### Shortcuts (while running scrcpy)
- **Switch fullscreen mode**: `Ctrl + f`
- **Rotate display**: `Ctrl + r`
- **Power off device screen**: `Ctrl + o`
- **Volume up/down**: `Ctrl + ↑` / `Ctrl + ↓`
- **Home**: `Ctrl + h`
- **Back**: `Ctrl + b`
- **App switch**: `Ctrl + s`
- **Expand notification panel**: `Ctrl + n`

### Additional Tips
- **Wireless mode**: After enabling TCP/IP mode, you can connect wirelessly without needing USB after the initial setup.
- **Reduce latency**: Use the `--no-display` option if you're just recording the screen and don't need to see it in real-time.

This should cover most common use cases with scrcpy!

---
To use scrcpy in wireless mode, follow these steps:

### Step 1: Connect Your Device via USB
1. Connect your Android device to your computer using a USB cable.
2. Ensure USB debugging is enabled on your device.

### Step 2: Get the Device IP Address
1. Open a terminal (Command Prompt, PowerShell, or Terminal).
2. Type the following command to get the device's IP address:
   ```bash
   adb shell ip route
   ```
3. Look for the line that starts with `default via`, and note the IP address listed (usually it will look something like `192.168.1.x`).

### Step 3: Enable Wireless ADB
1. Still in the terminal, enter the following command to enable wireless ADB:
   ```bash
   adb tcpip 5555
   ```

### Step 4: Disconnect USB
1. Unplug the USB cable from your device.

### Step 5: Connect Wirelessly
1. In the terminal, connect to the device using its IP address:
   ```bash
   adb connect <device_ip_address>:5555
   ```
   Replace `<device_ip_address>` with the IP address you noted earlier.

### Step 6: Start scrcpy
1. Once connected, you can start scrcpy by typing:
   ```bash
   scrcpy
   ```

### Additional Tips
- Ensure that both your computer and Android device are on the same Wi-Fi network.
- If you experience lag or connection issues, try moving closer to the router.

If you have any trouble, feel free to ask!
