# Build multi-platform apps in Python powered by Flutter

- https://flet.dev/
- https://flet.dev/docs/getting-started/create-flet-app

## Build MacOS:

- Install Flutter: https://docs.flutter.dev/get-started/install/macos/desktop
  - Xcode
    ```bash
    sudo softwareupdate --install-rosetta --agree-to-license
    sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
    sudo xcodebuild -license
    ```
  - CocoaPods:
    ```bash
    # install ruby version via asdf for compatibility
    # install asdf https://asdf-vm.com/guide/getting-started.html
    # install asdf ruby plugin https://github.com/asdf-vm/asdf-ruby
    brew install asdf
    echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
    asdf local ruby 3.1.3
    which ruby
    gem install cocoapods
    ```
  - Flutter SDK: https://docs.flutter.dev/get-started/install/macos/desktop
    ```bash
    brew install aria2
    aria2c -x10 [flutter sdk url]
    flutter doctor
    ```
- Build for MacOs:

```bash
flet build macos --arch arm64
flet build macos --arch x86_64
```

## Debug:

### 
```bash
    macos/Runner/AppDelegate.swift uses the deprecated @NSApplicationMain attribute, updating.
    macos/Runner/AppDelegate.swift does not override applicationSupportsSecureRestorableState. Updating.
    .gitignore does not ignore Swift Package Manager build directories, updating.
    --- xcodebuild: WARNING: Using the first of multiple matching destinations:
    { platform:macOS, arch:arm64, id:00006000-001810DC3602401E, name:My Mac }
    { platform:macOS, arch:x86_64, id:00006000-001810DC3602401E, name:My Mac }
    ../../../../../../.pub-cache/hosted/pub.dev/flet-0.25.1/lib/src/utils/theme.dart:356:28: Error: A value of type 'TabBarThemeData' can't be returned from a function with return type
    'TabBarTheme?'.
    - 'TabBarThemeData' is from 'package:flutter/src/material/tab_bar_theme.dart' ('../../../../../../flutter/flutter/packages/flutter/lib/src/material/tab_bar_theme.dart').
    - 'TabBarTheme' is from 'package:flutter/src/material/tab_bar_theme.dart' ('../../../../../../flutter/flutter/packages/flutter/lib/src/material/tab_bar_theme.dart').
        return theme.tabBarTheme.copyWith(
                                ^
    ../../../../../../.pub-cache/hosted/pub.dev/flet-0.25.1/lib/src/utils/theme.dart:438:28: Error: A value of type 'DialogThemeData' can't be returned from a function with return type
    'DialogTheme?'.
    - 'DialogThemeData' is from 'package:flutter/src/material/dialog_theme.dart' ('../../../../../../flutter/flutter/packages/flutter/lib/src/material/dialog_theme.dart').
    - 'DialogTheme' is from 'package:flutter/src/material/dialog_theme.dart' ('../../../../../../flutter/flutter/packages/flutter/lib/src/material/dialog_theme.dart').
        return theme.dialogTheme.copyWith(
                                ^
    ../../../../../../.pub-cache/hosted/pub.dev/flet-0.25.1/lib/src/utils/theme.dart:482:26: Error: A value of type 'CardThemeData' can't be returned from a function with return type
    'CardTheme?'.
    - 'CardThemeData' is from 'package:flutter/src/material/card_theme.dart' ('../../../../../../flutter/flutter/packages/flutter/lib/src/material/card_theme.dart').
    - 'CardTheme' is from 'package:flutter/src/material/card_theme.dart' ('../../../../../../flutter/flutter/packages/flutter/lib/src/material/card_theme.dart').
        return theme.cardTheme.copyWith(
                            ^
    Target kernel_snapshot_program failed: Exception

    Command PhaseScriptExecution failed with a nonzero exit code

    warning: Run script build phase 'Run Script' will be run during every build because it does not specify any outputs. To address this issue, either add output dependencies to the
    script phase, or configure it to run in every build by unchecking "Based on dependency analysis" in the script phase. (in target 'Flutter Assemble' from project 'Runner')
    ** BUILD FAILED **

    Build process failed

    Error building Flet app - see the log of failed command above.
```

- Solution: switch Flutter to older version such as 3.24.5

```bash
flutter doctor -v # to get Flutter installed location such as `Flutter version 3.27.0 on channel stable at /Users/[user]/flutter/flutter`
cd /Users/[user]/flutter/flutter
git checkout 3.24.5
flutter doctor -v
```