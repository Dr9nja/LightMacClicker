# LightMacClicker

> **INFO**  
> An experimental clicker to test out how AppleScript works!

## How to use it

To use this code, you must have `cliclick` installed via Homebrew. You can install it by running the following command in your Terminal window:

```bash
brew install cliclick
```

### Fixing the "App is damaged / Cannot be opened" Error
Because this script application is compiled locally on your machine, it lacks a registered Apple Developer digital certificate. macOS Gatekeeper defaults to blocking it as an untrusted or damaged file. 

You can fix this easily using **either** of the following methods:

#### Method 1: The Terminal Fix (Fastest)
1. Open your **Terminal** app.
2. Type the following command (include the trailing space):
   ```bash
   xattr -cr 
   ```
3. Drag and drop your compiled `LightMacClicker.app` straight from Finder into the Terminal window to automatically populate its path.
4. Press **Enter**. The app will now open normally.

#### Method 2: The macOS System Settings Fix
1. Try to open the app once so the block is registered by the system.
2. Open your Mac's **System Settings** and navigate to **Privacy & Security**.
3. Scroll down until you see the **Security** section.
4. Look for a message stating: *“LightMacClicker was blocked from use because it is not from an identified developer”*.
5. Click **Open Anyway** and enter your Mac password to permanently allow it to run.

## Plans

- [x] Add prompt to ask user for runtime duration and click intervals.
- [x] Add a graphical interface using Cocoa / AppleScriptObjC!

:P
