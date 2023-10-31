- [MacOS](#macos)
  - [Useful commands](#useful-commands)
    - [1. Turn Off Dashboard](#1-turn-off-dashboard)
    - [2. Create a File Of Any Size](#2-create-a-file-of-any-size)
    - [3. Check the Uptime Of Your Mac](#3-check-the-uptime-of-your-mac)
    - [4. Enable Text Selection in Quick Look](#4-enable-text-selection-in-quick-look)
    - [5. Change Screenshot Location](#5-change-screenshot-location)
    - [6. Change Screenshot File Format](#6-change-screenshot-file-format)
    - [7. Records all terminal output (3rd party)](#7-records-all-terminal-output-3rd-party)
    - [8. Launch application from terminal: edit `.zshrc` and add these lines at the end](#8-launch-application-from-terminal-edit-zshrc-and-add-these-lines-at-the-end)
    - [9. Installing multiple versions of Python](#9-installing-multiple-versions-of-python)
    - [10. Run, stop Docker from terminal](#10-run-stop-docker-from-terminal)
    - [11. Syntax highlighting in nano on Mac OS X](#11-syntax-highlighting-in-nano-on-mac-os-x)
    - [12. My awesome HomeBrew list](#12-my-awesome-homebrew-list)
    - [13. Proccess monitoring, remove leftovers, reset trial](#13-proccess-monitoring-remove-leftovers-reset-trial)
  - [Useful key shortcuts](#useful-key-shortcuts)
    - [1. Show hidden files in Finder `shift + command + .`](#1-show-hidden-files-in-finder-shift--command--)
  - [Error](#error)
    - [1. rails:](#1-rails)
  - [Others commands:](#others-commands)

# MacOS

## Useful commands

### 1. Turn Off Dashboard

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

### 2. Create a File Of Any Size

- Create an empty file of any size that we want.

```
mkfile 1g test.abc
```

- Can specify the file size in bytes (b), kilobytes (k), megabytes (m) or gigabytes (g). The above example creates a test file of 1GB called test.abc but you can name it whatever you wish and it doesn’t need to have a file extension.

### 3. Check the Uptime Of Your Mac

- To see how long our Mac has gone without a restart

```
uptime
```

### 4. Enable Text Selection in Quick Look

```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
killall Finder
```

- To revert the changes:

```
defaults write com.apple.finder QLEnableTextSelection -bool FALSE
killall Finder
```

### 5. Change Screenshot Location

```
defaults write com.apple.screencapture location /drag/location/here
killall SystemUIServer
```

- To undo the changes

```
defaults write com.apple.screencapture location ~/Desktop
killall SystemUIServer
```

### 6. Change Screenshot File Format

```
defaults write com.apple.screencapture type PDF
killall SystemUIServer

defaults write com.apple.screencapture type png
killall SystemUIServer
```

### 7. Records all terminal output (3rd party)

- Install the recorder

```
brew install asciinema
```

- Start recording

```
asciinema rec
```

- This spawns a new shell instance and records all terminal output. When you're ready to finish simply exit the shell either by typing `exit` or hitting `Ctrl-D`.

### 8. Launch application from terminal: edit `.zshrc` and add these lines at the end

```zsh
# export for mysql
export PATH="/usr/local/mysql/bin:$PATH"

# export for maven
export M2_HOME=/Applications/apache-maven-3.5.4
export PATH=$PATH:$M2_HOME/bin

# for vscode
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}
# for sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# for ngrok
alias ngrok="~/Downloads/ngrok/ngrok"

# for pyenv
eval "$(pyenv init -)"

# for rbenv
# eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"
```

### 9. [Installing multiple versions of Python](https://github.com/pyenv/pyenv)

- tutorial [https://weknowinc.com/blog/running-multiple-python-versions-mac-osx](https://weknowinc.com/blog/running-multiple-python-versions-mac-osx)

### 10. Run, stop Docker from terminal

```sh
alias docker-service="open -a /Applications/Docker.app --hide"
alias docker-stop="ps -ax | grep "/Applications/Docker.app/Contents/MacOS/Docker" | head -1 | awk {'print $1'} | xargs kill -9"
```

### 11. Syntax highlighting in nano on Mac OS X

- install nano

```sh
# install nano from homebrew
brew install nano

# update your nanorc file with the contents of the nanorc file below
nano ~/.nanorc

# add to ~/.zshrc or ~/.bashrc
export PATH=/usr/local/bin:$PATH

# re-open your terminal and you'll have syntax highlighting
```

- ~/.nanorc

```php
include /usr/local/share/nano/*.nanorc
```

### 12. My awesome HomeBrew list

```
brew analytics off
```

```
brew list --cask
brew install --cask iterm2 lulu jd-gui shottr vagrant vlc docker firefox
```

```
➜  ~ brew list
==> Formulae
ansible        ffuf           htop           rclone         autojump
exiftool       imagemagick    nmap           wget           ipinfo-cli
hashcat        fzf            inetutils      wpscan         gcc
ffmpeg         jq             libmpc         dex2jar        jupyterlab
trash          terraform


```
### 13. Proccess monitoring, remove leftovers, reset trial
- lazy, just some notes, need to improve

```bash
brew install --cask lulu
brew install --cask shottr # 30 days trial
brew install trash
sudo fs_usage | grep -e 'open' -e 'create' | grep shottr
 sudo fs_usage -w -f filesys | grep -e 'open' | grep shottr
```

```
sudo fs_usage | grep -e 'open' -e 'create' | grep shottr
11:05:37  open              /Users/username/Library/Containers/cc.ffitch.shottr/Data/Library/Preferences        0.000534   cfprefsd
11:05:37  openat            [3]/cc.ffitch.shottr.plist                                                       0.000046   cfprefsd
11:05:37  openat            0lf5yz971bgw9c9yt0sjn300000gn/T/TemporaryItems/cc.ffitch.shottr.plist.hjsuz2E    0.000137   cfprefsd
11:05:38  open              /Users/username/Library/Containers/cc.ffitch.shottr/Data/Library/Preferences        0.000046   cfprefsd
11:05:38  openat            [3]/cc.ffitch.shottr.plist                                                       0.000030   cfprefsd
11:05:38  openat            0lf5yz971bgw9c9yt0sjn300000gn/T/TemporaryItems/cc.ffitch.shottr.plist.j16V11D    0.001428   cfprefsd
...
```

```
$ sudo opensnoop -n Shottr | tee -a ~/tmp/opensnoop.shottr.txt
dtrace: system integrity protection is on, some features will not be available

  UID    PID COMM          FD PATH
  501  25475 Shottr        10 /System/Library/Fonts/Keyboard.ttf
  501  25475 Shottr        10 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Resources
  501  25475 Shottr        10 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Resources
  501  25475 Shottr        10 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Resources/English.lproj
  501  25475 Shottr        -1 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Resources/Base.lproj
  501  25475 Shottr        10 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Resources/Menus.loctable
  501  25475 Shottr        10 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/
  501  25475 Shottr        -1 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework//English.lproj
  501  25475 Shottr        -1 /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework//Base.lproj
  501  25475 Shottr        10 /System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/Graphite.car
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/Info.plist
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/Info.plist
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/
  501  25475 Shottr        -1 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc//en.lproj
  501  25475 Shottr        -1 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc//Base.lproj
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/NSWindowController-3cz-fX-Ya1.nib
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/vXi-bH-nTd-view-fki-md-Men.nib
  501  25475 Shottr        10 /System/Library/Frameworks/AppKit.framework/Resources/Placeholders.loctable
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/6sQ-om-XCe-view-qXZ-XU-bNz.nib
  501  25475 Shottr        -1 /System/Library/CoreServices/RawCamera.bundle/RawCamera
  501  25475 Shottr        10 /System/Library/CoreServices/RawCamera.bundle
  501  25475 Shottr        -1 /System/Library/CoreServices/RawCamera.bundle/RawCamera
  501  25475 Shottr        10 /System/Library/CoreServices/RawCamera.bundle
  501  25475 Shottr        10 /dev/dtracehelper
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphs.bundle/Contents/Resources/name_aliases.strings
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents/Info.plist
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents/Resources
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents/Resources
  501  25475 Shottr        -1 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents/Resources/en.lproj
  501  25475 Shottr        -1 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents/Resources/Base.lproj
  501  25475 Shottr        10 /System/Library/PrivateFrameworks/SFSymbols.framework/Versions/A/Resources/CoreGlyphsPrivate.bundle/Contents/Resources/Assets.car
  501  25475 Shottr        10 /System/Library/Frameworks/AppKit.framework/Resources/Accessibility.loctable
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Info.plist
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Resources
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Resources
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Resources/en.lproj
  501  25475 Shottr        -1 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Resources/Base.lproj
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Resources/en.lproj/Localizable.strings
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/KeyboardShortcuts_KeyboardShortcuts.bundle/Contents/Resources/en.lproj/Localizable.strings
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/NTL-U4-RCY-view-jEA-Ft-qg2.nib
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/Resources/Preferences.storyboardc/YPR-Ju-4pY-view-Mcz-Zk-Zk0.nib
  501  25475 Shottr        10 /Applications/Shottr.app/Contents/PkgInfo
  501  25475 Shottr        10 /System/Library/Frameworks/Foundation.framework/Resources
  501  25475 Shottr        10 /var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/com.apple.iconservices/store.index
  501  25475 Shottr        10 /Library/Caches/com.apple.iconservices.store/590B9AFD-6BBD-3176-8EC4-1BAA803025AB.isdata
```

```
cp ~/tmp/opensnoop.shottr.txt ~/tmp/file_access_log.txt
awk '$NF ~ "^/" {print $NF}' ~/tmp/file_access_log.txt | grep -vE '^/System/|^/Library/' | grep -v "/Applications/Shottr.app" | grep -v "/dev/dtracehelper" | sort -

/
/Users/username/Library/Colors
/Users/username/Library/Containers/cc.ffitch.shottr/Data/Library/Security
/Users/username/Library/Keychains/login.keychain-db
/etc/localtime
/private/var/db/mds/messages/501/se_SecurityMessages
/private/var/db/mds/system/mdsDirectory.db
/private/var/db/mds/system/mdsObject.db
/usr/lib/libobjc-trampolines.dylib
/usr/share/icu/icudt70l.dat
/var/db/timezone/icutz/icutz44l.dat
/var/db/timezone/zoneinfo/posixrules
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mds.lock
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mdsDirectory.db
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mdsDirectory.db_
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mdsObject.db
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mdsObject.db_
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr/com.apple.IntlDataCache.le
```

- uninstall the app, check leftovers

```
brew uninstall --cask shottr
```

```
trash ~/Library/Containers/cc.ffitch.shottr
awk '$NF ~ "^/" {print $NF}' file_access_log.txt | grep -vE '^/System/|^/Library/' | grep -v "/Applications/Shottr.app" | grep -v "/dev/dtracehelper" | sort -u | xargs -I{} sh -c 'if [ -e "$1" ]; then echo "$1 exists."; fi' sh {}

/ exists.
/Users/username/Library/Colors exists.
/Users/username/Library/Keychains/login.keychain-db exists.
/etc/localtime exists.
/private/var/db/mds/messages/501/se_SecurityMessages exists.
/private/var/db/mds/system/mdsDirectory.db exists.
/private/var/db/mds/system/mdsObject.db exists.
/usr/lib/libobjc-trampolines.dylib exists.
/usr/share/icu/icudt70l.dat exists.
/var/db/timezone/icutz/icutz44l.dat exists.
/var/db/timezone/zoneinfo/posixrules exists.
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mds.lock exists.
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mdsDirectory.db exists.
/var/folders/63/m0lf5yz971bgw9c9yt0sjn300000gn/C/cc.ffitch.shottr//mds/mdsObject.db exists.
```

To completely remove the app, you have to go over each of these folders one by one and delete the following:

- Binary and dock icons are located in `/Applications/`
- Application support files are located in `~/Library/Application Support`
- Support Caches can be found in `/Library/Caches/` and `~/Library/Caches`
- Plugins are located in `~/Library/Internet Plug-Ins/`
- Library can be found in `~/Library/`
- App preferences are located in `~/Library/Preferences/`
- Crashes are found in `~/Library/Application Support/CrashReporter/`
- App saved states are located in `~/Library/Saved Application State/`

## Useful key shortcuts

### 1. Show hidden files in Finder `shift + command + .`

## Error

### 1. rails:

- bundle install error: sqlite3

```sh
bundle config build.sqlite3 --with-sqlite3-include=$HOME/include --with-sqlite3-lib=$HOME/lib --with-sqlite3-dir=$HOME/bin
bundle install
```

- bundle install error: mysql2

```
Errno::EPERM: Operation not permitted @ apply2files -
/Users/me/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/mysql2-0.4.9/CHANGELOG.md
An error occurred while installing mysql2 (0.4.9), and Bundler cannot continue.
Make sure that `gem install mysql2 -v '0.4.9' --source 'https://rubygems.org/'` succeeds before bundling.

In Gemfile:
  mysql2
```

```
sudo gem install mysql2 -v '0.4.9' -- --srcdir=/usr/local/mysql/include
```

## Others commands:
