# LightMacClicker

> **INFO**  
> An experimental clicker to test out how AppleScript works!

## How to use it

To use this code, you must have `cliclick` installed via Homebrew. You can install it by running the following command in your Terminal window:

```bash
brew install cliclick
```

### Fixing the "App is damaged / Cannot be opened" Error

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/7bf5cc5a-55d0-4fe1-96d4-057b4fd0dbf4">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/768994cc-b718-4780-9a14-84be25647bb1">
  <img width="421" height="422" alt="Screenshot" src="https://github.com/user-attachments/assets/768994cc-b718-4780-9a14-84be25647bb1">
</picture>

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

<picture>
<source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/fe3f71d9-409b-49f3-8864-d1813dc7b140">
<source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/259a11ee-c50b-44b4-87e3-4a01b439a926">
<img width="716" height="422" alt="Screenshot 2026-11-01 at 00 46 04" src="https://github.com/user-attachments/assets/259a11ee-c50b-44b4-87e3-4a01b439a926" />
</picture>


1. Try to open the app once so the block is registered by the system.
2. Open your Mac's **System Settings** and navigate to **Privacy & Security**.
3. Scroll down until you see the **Security** section.
4. Look for a message stating: *“Apple could not verify "LightMacClicker" is free of malware that may harm your Mac or compromise your privacy.”*.
5. Click **Open Anyway** and enter your Mac password to permanently allow it to run.

## Plans

- [x] Add prompt to ask user for runtime duration and click intervals.
- [x] Add a graphical interface using Cocoa / AppleScriptObjC!

:P
