#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
HotKeySet("{F8}", "Terminate")
HotKeySet("{F9}", "ExitGui")

Global $paused = False

#Region ### START Koda GUI section ### Form=
$Genshin = GUICreate("Press F", 231, 137, 378, 157)
$Title = GUICtrlCreateLabel("Genshin Impact", 32, 16, 188, 36)
GUICtrlSetFont(-1, 20, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Button1 = GUICtrlCreateButton("Auto Press F", 48, 56, 131, 25)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Label1 = GUICtrlCreateLabel("OFF", 96, 96, 36, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $Button1
			Auto()
	EndSwitch
WEnd

Func Auto()
   GUICtrlSetColor($Button1,0xFF0000)
   GUICtrlSetData($Label1, "ON")
   ToolTip("Đã bật auto", 0, 0)
   Sleep(1000)
   While $paused = False
        if _ispressed('46') then
		 pressF()
	  EndIf
   WEnd
   ;Exit
EndFunc


Func pressF()
   $i = 0
   While $i <= 20
	  Send("{f down}")
	  Send("{f up}")
	  Sleep(200)
	  $i = $i + 1
   WEnd
EndFunc

Func Terminate()
   If $paused == False then
	  $paused = True
	  GUICtrlSetData($Label1, "OFF")
	  GUICtrlSetColor($Button1,0x000000)
	  ToolTip("Đã tắt auto", 0, 0)
	  Sleep(1000)
   ElseIf $paused == True then
	  $paused = False
	  Auto()
	  GUICtrlSetColor($Button1,0xFF0000)
   EndIf
EndFunc


Func ExitGui()
   Exit
EndFunc




