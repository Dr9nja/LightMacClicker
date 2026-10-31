set cliclickPath to "/opt/homebrew/bin/cliclick"

-- 1. Verify that cliclick is installed before doing anything else
tell application "System Events"
	set fileExists to exists disk item cliclickPath
end tell

if not fileExists then
	display dialog "Homebrew 'cliclick' was not found at " & cliclickPath & return & return & "Please install it using: brew install cliclick" buttons {"OK"} default button "OK" with icon stop
	return
end if

-- 2. Ask the user for the gap between clicks (in seconds)
try
	set gapResponse to display dialog "Enter the gap between clicks (in seconds):" default answer "5" buttons {"Cancel", "OK"} default button "OK"
	set secondsGap to text returned of gapResponse as integer
on error
	return -- User canceled
end try

-- 3. Ask the user for the total duration (in minutes)
try
	set durationResponse to display dialog "Enter how many minutes this should run:" default answer "10" buttons {"Cancel", "OK"} default button "OK"
	set totalMinutes to text returned of durationResponse as integer
on error
	return -- User canceled
end try

-- 4. Calculate total seconds and loop iterations
set totalSeconds to totalMinutes * 60
set totalClicks to totalSeconds / secondsGap

-- 5. Execution Loop
repeat totalClicks times
	try
		-- Right-click at the current mouse position
		do shell script "" & cliclickPath & " rc:."
	on error errMsg
		display dialog "Error running cliclick: " & errMsg buttons {"Stop Script"} default button "Stop Script"
		return
	end try
	
	-- Pause for the requested gap before clicking again
	delay secondsGap
end repeat

display dialog "Clicking session completed successfully with total clicks of " & totalClicks & "!" buttons {"OK"} default button "OK"
