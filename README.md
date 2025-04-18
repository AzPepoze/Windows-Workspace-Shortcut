# ✨ Windows Workspace Shortcut ✨

This script allows you to easily switch and move windows between `Windows Workspaces` using Hotkeys.

This project uses the [VirtualDesktopAccessor](https://github.com/Ciantic/VirtualDesktopAccessor) library. Thank you to the creators and contributors.

## ✨ Features ✨

This script allows you to:

-    Switch to a specific `Windows Workspace` (and creates it if it doesn't exist).
-    Move the currently active window to a specific `Windows Workspace` and switch to that desktop.
-    Navigate between `Windows Workspaces` using `Alt + Number` hotkeys.
-    Move active window to a specific `Windows Workspace` and follow using `Alt + Shift + Number` hotkeys.

## ⚙️ Configuration ⚙️

You can customize the hotkeys by editing the `config.ini` file. Open the file and modify the values in the `[Hotkeys]` section to your desired key combinations. For example:

```ini
[Hotkeys]
SwitchDesktop1 = ^1 ; Ctrl + 1
MoveWindowDesktop1 = ^+1 ; Ctrl + Shift + 1
```

Save the `config.ini` file after making your changes.

## 🛠️ Usage / Installation 🛠️

1.   Clone this repository to your local machine.
2.   Make sure you have [AutoHotkey](https://www.autohotkey.com/) installed.
3.   Double-click the `WindowsWorkspaceShortcut.ahk` file to run the script. The script will start in the system tray.
4.   Use the hotkeys defined in `config.ini` to switch between `Windows Workspace`s and move windows.
