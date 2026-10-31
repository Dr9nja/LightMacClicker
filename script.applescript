use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
use framework "AppKit"

-- Using AppleSctiptObjC (ASObjC)  for easier user friendly interface!!

property NSAlert : a reference to current application's NSAlert
property NSTextField : a reference to current application's NSTextField
property NSView : a reference to current application's NSView
property NSRect : a reference to current application's NSRect

set cliclickPath to "/opt/homebrew/bin/cliclick"

-- 1. Verify that cliclick is installed before doing anything else
tell application "System Events"
	set fileExists to exists disk item cliclickPath
end tell

if not fileExists then
	display dialog "Homebrew 'cliclick' was not found at " & cliclickPath & return & return & "Please install it using: brew install cliclick" buttons {"OK"} default button "OK" with icon stop
	return
end if

-- Main Thread protection wrapper
if not (current application's NSThread's isMainThread()) then
	display dialog "This script must be run on the main thread. If you are in FastScripts or a custom runner, enable 'Run on Main Thread'." buttons {"OK"} default button "OK"
	return
end if


-- Ask the user for the gap between clicks (in seconds)
--try
--	set gapResponse to display dialog "Enter the gap between clicks (in seconds):" default answer "5" buttons {"Cancel", "OK"} default button "OK"
--set secondsGap to text returned of gapResponse as integer
--on error
--return -- User canceled
--end try

-- 2. Simple User Interface, or just multi-input window via ASObjS

set currentApp to current application
set theAlert to NSAlert's alloc()'s init()
theAlert's setMessageText:"LightMacClicker Settings"
theAlert's setInformativeText:"Hai!! Configure your clicking session parameters here:"
theAlert's addButtonWithTitle:"Start Clicker"
theAlert's addButtonWithTitle:"Cancel"

-- some frame proportions
set frame_w to 300
set frame_h to 100

-- Smol container for text inputs 

set accessoryView to NSView's alloc()'s initWithFrame:(currentApp's NSMakeRect(0, 0, frame_w, frame_h))

-- "interval" Input Box
set inputInterval to NSTextField's alloc()'s initWithFrame:(currentApp's NSMakeRect((frame_w / 2), (frame_h * 0.5), 80, 22))
inputInterval's setStringValue:"5" -- basic value
set labelInterval to NSTextField's alloc()'s initWithFrame:(currentApp's NSMakeRect(0, (frame_h * 0.5), 140, 22))
labelInterval's setStringValue:"Interval (seconds):"
labelInterval's setBezeled:false
labelInterval's setDrawsBackground:false
labelInterval's setEditable:false

-- "duration" input box
set inputDuration to NSTextField's alloc()'s initWithFrame:(currentApp's NSMakeRect((frame_w / 2), (frame_h * 0.1), 80, 22))
inputDuration's setStringValue:"10" -- basic value
set labelDuration to NSTextField's alloc()'s initWithFrame:(currentApp's NSMakeRect(0, (frame_h * 0.1), 140, 22))
labelDuration's setStringValue:"Duration (minutes):"
labelDuration's setBezeled:false
labelDuration's setDrawsBackground:false
labelDuration's setEditable:false

-- labels next to the fields (draw)
accessoryView's addSubview:inputInterval
accessoryView's addSubview:labelInterval
accessoryView's addSubview:inputDuration
accessoryView's addSubview:labelDuration

-- attaching the view to the window
theAlert's setAccessoryView:accessoryView

-- Ask the user for the total duration (in minutes)
--try
--set durationResponse to display dialog "Enter how many minutes this should run:" default answer "10" buttons {"Cancel", "OK"} default button "OK"
--set totalMinutes to text returned of durationResponse as integer
--on error
--return -- User canceled
--end try

-- 3. show the window and capture results
set modalResponse to theAlert's runModal()

-- if user clicks "Start Clicker" (which is 1000)
if modalResponse is 1000 then
	set secondsGap to (inputInterval's stringValue()) as integer
	set totalMinutes to (inputDuration's stringValue()) as integer
	
	--Calculating loops
	set totalSeconds to totalMinutes * 60
	set totalClicks to totalSeconds / secondsGap
	
	--Execute
	repeat totalClicks times
		try
			do shell script "" & cliclickPath & " rc:."
		on error errMsg
			display dialog "Error running cliclick: " & errMsg buttons {"Stop Script"} default button "Stop Script"
			return
		end try
	end repeat
	display dialog "Clicking session completed successfully with total clicks of " & totalClicks & "!" buttons {"OK"} default button "OK"
end if


