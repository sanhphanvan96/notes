# MacOS
## Useful commands

1. Turn Off Dashboard

- Dashboard was once the future of quick-to-access apps such as a calculator and sticky notes. Despite being quite popular for a few years, it’s quickly faded into obscurity. It’s still around and usually opened accidentally.

- I use Mission Control extensively and have it positioned on the far left but, honestly, I prefer it gone completely. Thankfully, Dashboard can be permanently silenced:

```
defaults write com.apple.dashboard mcx-disabled -boolean TRUE
killall Dock
```

- You’ll find that Dashboard is no longer running, along with any widgets you might have had inside. Don’t worry, you can bring it back if necessary:

```
defaults write com.apple.dashboard mcx-disabled -boolean FALSE
killall Dock
```

2. Create a File Of Any Size

- Create an empty file of any size that we want.

```
mkfile 1g test.abc
```

- Can specify the file size in bytes (b), kilobytes (k), megabytes (m) or gigabytes (g). The above example creates a test file of 1GB called test.abc but you can name it whatever you wish and it doesn’t need to have a file extension.

3. Check the Uptime Of Your Mac

- To see how long our Mac has gone without a restart
```
uptime
```

4. Enable Text Selection in Quick Look

```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
killall Finder
```

- To revert the changes:
```
defaults write com.apple.finder QLEnableTextSelection -bool FALSE
killall Finder
```

5. Change Screenshot Location

```
defaults write com.apple.screencapture location /drag/location/here
killall SystemUIServer
```

- To undo the changes

```
defaults write com.apple.screencapture location ~/Desktop
killall SystemUIServer
```

6. Change Screenshot File Format

```
defaults write com.apple.screencapture type PDF
killall SystemUIServer

defaults write com.apple.screencapture type png
killall SystemUIServer
```

7. Records all terminal output (3rd party)

- Install the recorder
```
brew install asciinema
```
- Start recording
```
asciinema rec
```
- This spawns a new shell instance and records all terminal output. When you're ready to finish simply exit the shell either by typing ```exit``` or hitting ```Ctrl-D```.
## Userful key shortcuts
