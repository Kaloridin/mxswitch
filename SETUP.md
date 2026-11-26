Fn-key mouse switching: setup
Switch a Logitech Easy-Switch mouse between computers with Fn+Q / Fn+W / Fn+E
(channels 1 / 2 / 3) on a NuPhy keyboard, alongside the keyboard's own
Fn+1 / Fn+2 / Fn+3 for sending the keyboard itself.
How it fits together:
```
Fn+Q ──(keyboard firmware)──> F13 ──(hotkey on the PC)──> mxswitch 1
Fn+W F14 mxswitch 2
Fn+E F15 mxswitch 3
```
Before you start
Pair consistently. Each computer must sit on the same slot number on the
keyboard and on the mouse (e.g. work PC = 1 on both, Steam Deck = 2 on both).
Keyboard mapping (one time, any computer). In NuPhy IO, open the
Windows-mode Fn layer and set Q, W, E to F13, F14, F15. This is
stored on the keyboard, so it carries to every machine. Keep the keyboard's
mode switch on Windows, including on Linux.
Every machine needs the setup below. A switch is always sent by the
computer the mouse is currently on.
Windows
1. Get the files. Clone the repo, or download it as a ZIP and extract it:
```powershell
git clone https://github.com/Kaloridin/mxswitch.git C:\git\mxswitch
```
Only two files are used, and they must stay in the same folder:
`windows\mxswitch.ps1` and `windows\mxswitch-fn.ahk`.
2. Install AutoHotkey v2 from <https://www.autohotkey.com>. A per-user
install is fine; no admin rights are needed.
3. Test that the mouse is found (click it first to wake it):
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File C:\git\mxswitch\windows\mxswitch.ps1 -Info
```
4. Start the hotkeys. Double-click `windows\mxswitch-fn.ahk`. A green H
icon appears in the system tray.
5. Start them at login. Press Win+R, enter `shell:startup`, and put a
shortcut to `mxswitch-fn.ahk` in the folder that opens.
Linux (Steam Deck, Desktop Mode)
Everything below runs in Konsole in Desktop Mode. Game Mode is not covered:
it does not run KDE, so KDE shortcuts are not active there.
1. Set a sudo password (the `deck` user has none by default):
```sh
passwd
```
2. Get the files. Clone the repo, or download the ZIP from GitHub and
extract it to `~/mxswitch`:
```sh
git clone https://github.com/Kaloridin/mxswitch.git ~/mxswitch
```
3. Install the script into your home folder (SteamOS's system files are
read-only, so nothing goes there):
```sh
mkdir -p ~/.local/bin
install -m 755 ~/mxswitch/linux/mxswitch.sh ~/.local/bin/mxswitch
```
4. Allow access to the mouse (one time; the only step that needs root):
```sh
sudo cp ~/mxswitch/linux/42-logitech-hidpp.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger
```
5. Test that the mouse is found (click it first to wake it; if it is not
found, turn its Bluetooth connection off and on so the new rule applies):
```sh
~/.local/bin/mxswitch --info
```
6. Bind the keys. System Settings → Shortcuts → Add New → Command or
Script, three times:
Command
Press
May be shown as
`/home/deck/.local/bin/mxswitch 1`
Fn+Q
Tools
`/home/deck/.local/bin/mxswitch 2`
Fn+W
Launch5
`/home/deck/.local/bin/mxswitch 3`
Fn+E
Launch6
Linux names F13–F15 Tools / Launch5 / Launch6; that is expected. Use the full
path, since shortcut launchers do not always see your shell's PATH.
After a major SteamOS update, re-run step 5. If the mouse is no longer found,
repeat step 4.
Using it
Mouse first, then keyboard: press Fn+Q, then Fn+1. Once the keyboard has
left, its next keypress goes to the other computer, and that computer cannot
move a mouse that is not connected to it.
The target must be awake. If you switch to a computer that is asleep or
off, the mouse parks on a dead channel, and the button underneath the mouse
is the only way back.
Nothing happens? Click the mouse to wake it and press the key again. Run
the `-Info` / `--info` test from the setup steps to check that the mouse is found.
