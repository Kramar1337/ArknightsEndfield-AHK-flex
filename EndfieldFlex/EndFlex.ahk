/*
8-50
9-22
RETURNOFALL
ALLFIELD
ENDFIELD4PC
ENDFIELD


6 ивент
20 стандарт


https://endfield.gryphline.com/ru-ru
https://endfield.teamstardust.org/
https://www.prydwen.gg/arknights-endfield/characters
Endfield
ahk_class UnityWndClass
ahk_exe Endfield.exe
ahk_pid 6704


====================ArknightsEndfield AHK flex by Kramar1337====================

F1 - Автобой
F - Фастлут
Z - Скип диалогов





Изменения: 20.01.2026
 - Корявый автобой
 - Фастлут
 - Скип диалогов


*/

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On
CoordMode Mouse, Screen
CoordMode Pixel, Screen
SetTitleMatchMode, 2
Process, Priority,, High
Setbatchlines,-1
Menu,Tray, Icon, %A_ScriptDir%\data\icon.ico, ,1
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) 
{
	Try 
	{
		If (A_IsCompiled) 
			Run *RunAs "%A_ScriptFullPath%" /restart
		Else 
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}
IniRead, key_AutoCombat, data\Config.ini, Settings, key_AutoCombat
IniRead, key_Macro, data\Config.ini, Settings, key_Macro
IniRead, key_SkipNPC, data\Config.ini, Settings, key_SkipNPC
IniRead, key_Fastlyt, data\Config.ini, Settings, key_Fastlyt
IniRead, key_EndExitapp, data\Config.ini, Settings, key_EndExitapp
IniRead, key_Reload, data\Config.ini, Settings, key_Reload

IniRead, Checkbox_AutoCombat, data\Config.ini, Settings, Checkbox_AutoCombat
IniRead, Checkbox_Macro, data\Config.ini, Settings, Checkbox_Macro
IniRead, Checkbox_SkipNPC, data\Config.ini, Settings, Checkbox_SkipNPC
IniRead, Checkbox_Fastlyt, data\Config.ini, Settings, Checkbox_Fastlyt
IniRead, Checkbox_Reload, data\Config.ini, Settings, Checkbox_Reload

IniRead, FastlytFastMode, data\Config.ini, Settings, FastlytFastMode
IniRead, SelectDefaultMacro, data\Config.ini, Settings, SelectDefaultMacro
IniRead, SkipNPCLockMode, data\Config.ini, Settings, SkipNPCLockMode
IniRead, WindowFocus, data\Config.ini, Settings, WindowFocus

Hotkey, *~$%key_EndExitapp%, MetkaMenu1, on
if Checkbox_Reload
	Hotkey, *~$%key_Reload%, MetkaMenu4, on
Hotkey, IfWinActive, %WindowFocus%
if Checkbox_SkipNPC
	Hotkey, *~$%key_SkipNPC%, Label_SkipNPC, on
if Checkbox_Fastlyt
	Hotkey, *~$%key_Fastlyt%, Label_Fastlyt, on
if Checkbox_AutoCombat
	Hotkey, *~$%key_AutoCombat%, Label_AutoCombat, on
Hotkey, IfWinActive

if Checkbox_Macro
{
	Hotkey, *~$%key_Macro%, Metkakey_macro, on
	; Hotkey, *~$%key_LabelNumpad0%, LabelNumpad0, on
	; Hotkey, *~$%key_LabelNumpad1%, LabelNumpad1, on
	; Hotkey, *~$%key_LabelNumpad2%, LabelNumpad2, on
	; Hotkey, *~$%key_LabelNumpad3%, LabelNumpad3, on
	; Hotkey, *~$%key_LabelNumpad4%, LabelNumpad4, on
	; Hotkey, *~$%key_LabelNumpad5%, LabelNumpad5, on
	; Hotkey, *~$%key_LabelNumpad6%, LabelNumpad6, on
	; Hotkey, *~$%key_LabelNumpad7%, LabelNumpad7, on
}

Loop 30
{
	IndexVarL := A_Index - 1
	jopa%IndexVarL% := false
}
jopa%SelectDefaultMacro%:=true

AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"

Menu, Tray, NoStandard
Menu, Tray, DeleteAll
Menu, Tray, add, Reload, MetkaMenu4
Menu, Tray, Icon, Reload, shell32.dll, 239, 16
Menu, Tray, Default, Reload
Menu, Tray, add, Edit Config, MetkaMenu3
Menu, Tray, Icon, Edit Config, imageres.dll, 247, 16
Menu, Tray, add
Menu, Tray, add, Import Settings, MetkaMenu2
Menu, Tray, Icon, Import Settings, imageres.dll, 262, 16
Menu, Tray, add
Menu, Tray, add, Exit, MetkaMenu1
Menu, Tray, Icon, Exit, shell32.dll,28, 16

xSkip1:=round(A_ScreenWidth * (2480 / 2560)), ySkip1:=round(A_ScreenHeight * (90 / 1440))
xSkip2:=round(A_ScreenWidth * (1530 / 2560)), ySkip2:=round(A_ScreenHeight * (960 / 1440))
return



; F1::
; sleep 500
; ControlSend,ahk_parent, {sc1}, %WindowFocus%
; ControlClick, x1880 y1384, %WindowFocus%
; ControlClick,, %WindowFocus%, , Left, 1, x1880 y1384
; ControlClick, x1880 y1384, %WindowFocus%,,,, NA
; return



;============================Автобой
Label_AutoCombat:
Keywait %key_AutoCombat%
IfWinNotActive, %WindowFocus%
	Return
if FuncCursorVisible()
	Return
ToggleR1 := !ToggleR1
if (ToggleR1)
{
SetTimer, SpamKeys, 100
SendInput, {vk1 down}
}
else
{
SetTimer, SpamKeys, Off
SendInput, {vk1 up}
}
ToolTip,,,0,2
Return
SpamKeys:
	Tooltip, AutoCumbat`nPres %key_AutoCombat%,round(A_ScreenWidth * .5 - 50),0,2
	FuncRandomSleep()
	Sleep 150
	FuncRandomSleep()
	Sleep 150
if ((!WinActive(WindowFocus)) or FuncCursorVisible())
{
	ToggleR1 := !ToggleR1
	SetTimer, SpamKeys, Off
	ToolTip,,,0,2
	SendInput, {vk1 up}
	Return
}
	FuncRandomSpell()
	FuncRandomSleep()
	Sleep 150
	SendInput, {vk45}
	FuncRandomSleep()
	Sleep 150
if ((!WinActive(WindowFocus)) or FuncCursorVisible())
{
	ToggleR1 := !ToggleR1
	SetTimer, SpamKeys, Off
	ToolTip,,,0,2
	SendInput, {vk1 up}
	Return
}
return

FuncRandomSpell()
{
	Random, ScRandomVar1, 1, 4
	if ScRandomVar1 = 1
		SendInput, {vk31}
	if ScRandomVar1 = 2
		SendInput, {vk32}
	if ScRandomVar1 = 3
		SendInput, {vk33}
	if ScRandomVar1 = 4
		SendInput, {vk34}
}




;============================Скип диалогов NPC
Label_SkipNPC:
Sleep 150
IfWinNotActive, %WindowFocus%
	Return
if !FuncCursorVisible()
	Return
if SkipNPCLockMode
{
	Keywait %key_SkipNPC%
	Toggle1SkipNPC := !Toggle1SkipNPC
	if (Toggle1SkipNPC)
	{
	  SetTimer, TimerNpcSkip, on
	  Tooltip Skip NPC: Loop,round(A_ScreenWidth * .5 - 50),0,2
	}
	Else
	{
	  SetTimer, TimerNpcSkip, off
	  Tooltip,,0,0,2
	}
}
Else
{
	Loop
	{
		GetKeyState, SpaceVar, %key_SkipNPC%, P
		If SpaceVar = U
			break
		FuncRandomSleep()
		Click %xSkip1% %ySkip1%
		FuncRandomSleep()
		Click %xSkip2% %ySkip2%
	}
}
Return
;============================SetTimer Скип диалогов
TimerNpcSkip:
FuncRandomSleep()
if ((!WinActive(WindowFocus)) || (GetKeyVK(A_PriorKey) != GetKeyVK(key_SkipNPC)))
{
	Toggle1SkipNPC := !Toggle1SkipNPC
	SetTimer, TimerNpcSkip, off
	Tooltip,,0,0,2
	Return
}
Click %xSkip1% %ySkip1%
FuncRandomSleep()
if ((!WinActive(WindowFocus)) || (GetKeyVK(A_PriorKey) != GetKeyVK(key_SkipNPC)))
{
	Toggle1SkipNPC := !Toggle1SkipNPC
	SetTimer, TimerNpcSkip, off
	Tooltip,,0,0,2
	Return
}
Click %xSkip2% %ySkip2%
Return


;============================Фастлут
Label_fastlyt:
Sleep 120
IfWinNotActive, %WindowFocus%
	Return
if FuncCursorVisible()
	Return
Loop
{
	GetKeyState, SpaceVar, %key_Fastlyt%, P
	If SpaceVar = U
		break 
	SendInput {vk46}
	sleep 1
	if FastlytFastMode
		SendInput, {WheelDown}
	FuncRandomSleep()
}
return


;============================Макросы
Metkakey_macro:
Sleep 1
IfWinNotActive, %WindowFocus%
	Return
if !FuncCursorVisible()
	Return
; if jopa1
	; Goto Label_Goto_Auto_Attack
; if jopa2
	; Goto Label_Goto_Chixia_Rage
; if jopa3
	; Goto Label_Goto_Bhop
; if jopa4
	; Goto Label_Goto_Sanhua
; if jopa5
	; Goto Label_Goto_Chixia_RagePP
; if jopa6
	; Goto Label_Goto_High_jump
; if jopa7
	; Goto Label_Goto_Auto_pistols
Return



;============================Меню, Reload
MetkaMenu4:
Reload
Return
;============================Меню, открыть кфг Config
MetkaMenu3:
Run, notepad.exe "%A_ScriptDir%\data\Config.ini"
Return
;============================Меню, импорт настроек
MetkaMenu2:
    FileSelectFile, selectedFile, 3, %A_ScriptDir%, Выберите файл Config.ini, INI (*.ini)
    if selectedFile =
        return
    if (FileExist(selectedFile) && RegExMatch(selectedFile, "Config\.ini$") = 0)
    {
        MsgBox,,, Выбранный файл не является "Config.ini",1
        return
    }
    newFilePath := A_ScriptDir "\data\Config.ini"
    IniRead, sections, %selectedFile%, ,
    Loop, Parse, sections, `n
    {
        section := A_LoopField
        IniRead, keys, %selectedFile%, %section%
        Loop, Parse, keys, `n
        {
            keyArray := StrSplit(A_LoopField, "=")
            if (keyArray.MaxIndex() = 2) ; Проверить, была ли строка успешно разделена
            {
                paramName := keyArray[1]
                paramValue := keyArray[2]
                IniWrite, %paramValue%, %newFilePath%, %section%, %paramName%
            }
            else
            {
                MsgBox,,, Неправильный формат строки в файле: %selectedFile%
                continue
            }
        }
    }
    MsgBox,,, Настройки импортированы`n`nReload!,1
	Reload
Return
;============================Меню, выход
MetkaMenu1:
Exitapp
Return


;============================Функция: есть курсор мышки - 1, нет курсора - 0
FuncCursorVisible()
{
	StructSize1337 := A_PtrSize + 16
	VarSetCapacity(InfoStruct1337, StructSize1337)
	NumPut(StructSize1337, InfoStruct1337)
	DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	Result1337 := NumGet(InfoStruct1337, 8)
	if (Result1337 <> 0)
		CursorVisible := 1
	Else
		CursorVisible := 0
	Return CursorVisible
}
;============================Функция рандома Sleep
FuncRandomSleep()
{
	Random, ScRandomSleep, 15, 40
	Sleep %ScRandomSleep%
}

; ============================Калибровочка
; *~$PgUp::
; IfWinNotActive, %WindowFocus%
	; Return
; SleepVarRange+=5
; Tooltip % "Delay - " SleepVarRange,round(A_ScreenWidth * .5),0
; Return
; *~$PgDn::
; IfWinNotActive, %WindowFocus%
	; Return
; SleepVarRange-=5
; Tooltip % "Delay - " SleepVarRange,round(A_ScreenWidth * .5),0
; Return















