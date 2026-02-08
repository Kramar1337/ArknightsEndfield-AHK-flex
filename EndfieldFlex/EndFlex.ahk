/*
схемы
https://endfieldtools.dev/
статы пушек
https://datafield.cc/weapons
офф сайт
https://endfield.gryphline.com/ru-ru
отметки 1
https://game.skport.com/endfield/sign-in?header=0
отметки 2
https://act.skport.com/endfield/preDownload?header=0&hg_media=skport&hg_link_campaign=article
инвентарь
https://www.skport.com/iframe?type=prize&id=act_endfield_skport_079611
Пополнение от официалов
https://topup.gryphline.com/endfield
Впн Ру
https://chromewebstore.google.com/detail/%D0%B1%D0%B5%D1%81%D0%BF%D0%BB%D0%B0%D1%82%D0%BD%D0%BE%D0%B5-vpn-%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D0%B5/jbcepijpgdmjidneaiopaoadekelheee?utm_source=item-share-cb
видос про схемы от танкиста
https://www.youtube.com/watch?v=57HEGjYEx8A
гугл док схем
https://docs.google.com/spreadsheets/d/1g1bU6RzD9axhoOd0rB3z81wpgn0jzdNcgg4VSg___Oc/htmlview?usp=sharing&pru=AAABnBQlHI4*9jLGjW4xyuMK892hBOuNyQ#gid=1822299165
Лучший гайд на леватейн
https://www.youtube.com/watch?v=1wv7N8NmMiE&t=558s
Леватейн - Акэкури3-4 - Вулфгард - Арделия2-3

Лэва
Lae
Лева

Gil
Гил

Yvo
Ивон

====================ArknightsEndfield AHK flex by Kramar1337====================

F1 - Автобой
F - Фастлут
Z - Скип диалогов
V - Macro Key
Numpad 0 - Off
Numpad 1 - ЛКМ спам (сообщения NPC)
Numpad 2 - Shift spam (Пограничник)
Numpad 3 - Jump-LMB-Shift


Изменения: 08.02.2026
 - Автобой с ультами
 - V - Macro Key
 - Numpad 0 - Off
 - Numpad 1 - ЛКМ спам (сообщения NPC)
 - Numpad 2 - Shift spam (Пограничник)
 - Numpad 3 - Jump-LMB-Shift

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
IniRead, key_LabelNumpad0, data\Config.ini, Settings, key_LabelNumpad0
IniRead, key_LabelNumpad1, data\Config.ini, Settings, key_LabelNumpad1
IniRead, key_LabelNumpad2, data\Config.ini, Settings, key_LabelNumpad2
IniRead, key_LabelNumpad3, data\Config.ini, Settings, key_LabelNumpad3

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
	Hotkey, *~$%key_LabelNumpad0%, LabelNumpad0, on
	Hotkey, *~$%key_LabelNumpad1%, LabelNumpad1, on
	Hotkey, *~$%key_LabelNumpad2%, LabelNumpad2, on
	Hotkey, *~$%key_LabelNumpad3%, LabelNumpad3, on
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
SleepVarRange = 100
return

; F2::
; sleep 500
; ControlSend,ahk_parent, {vk1 down}, %WindowFocus%
; ControlClick, x1880 y1384, %WindowFocus%
; ControlClick,, %WindowFocus%, , Left, 1, x1880 y1384
; ControlClick, x1880 y1384, %WindowFocus%,,,, NA
; return

;============================Макросы
Metkakey_macro:
Sleep 1
IfWinNotActive, %WindowFocus%
	Return
if jopa1
	Goto Label_Goto_LMBSpam
if jopa2
	Goto Label_Goto_ShiftSpam
if jopa3
	Goto Label_Goto_JumpLMBShift
Return

;==========Обычный спам клик мыши
Label_Goto_LMBSpam:
Loop
{
    GetKeyState, State1, %key_Macro%, P
	If State1 = U
        break 
    Sleep 50
	FuncRandomSleep()
    SendInput, {vk1}
}
Return
;==========ShiftSpam
Label_Goto_ShiftSpam:
if FuncCursorVisible()
	Return
Loop
{
    GetKeyState, State1, %key_Macro%, P
	If State1 = U
        break 
    Sleep 50
	FuncRandomSleep()
	SendInput {vkA0 down} 		; шифт
	Sleep 15
	SendInput {vkA0 up} 		; шифт
}
Return
;==========JumpLMBShift
Label_Goto_JumpLMBShift:
if FuncCursorVisible()
	Return
; StartTime := A_TickCount
SendInput {vk1 down} 	; лкм зажать
Sleep 15
Loop
{
    GetKeyState, State1, %key_Macro%, P
	If State1 = U
        break
	
	SendInput {vkA0 down} 		; шифт
	Sleep 15
	SendInput {vkA0 up} 		; шифт
    Sleep 15
    SendInput {vk20} 		; пробел
	Sleep 15
	
}
SendInput {vk1 up}
; EndTime := A_TickCount
; Elapsed := EndTime - StartTime
; ToolTip, Время работы: %Elapsed% мс, round(A_ScreenWidth * .5),0
Return
/*
; ============================Калибровочка
*~$PgUp::
IfWinNotActive, %WindowFocus%
	Return
SleepVarRange+=5
Tooltip % "Delay - " SleepVarRange,round(A_ScreenWidth * .5),0
Return
*~$PgDn::
IfWinNotActive, %WindowFocus%
	Return
SleepVarRange-=5
Tooltip % "Delay - " SleepVarRange,round(A_ScreenWidth * .5),0
Return
*/

;===============================Off
LabelNumpad0:
IfWinNotActive, %WindowFocus%
	Return
FuncMacroRestore()
ToolTip,Off, 0, 0
sleep 500
ToolTip
Return
;===============================LMB Spam
LabelNumpad1:
IfWinNotActive, %WindowFocus%
	Return
FuncMacroRestore()
jopa1:=true
ToolTip,LMB Spam, 0, 0
sleep 500
ToolTip
Return
;===============================Shift Spam
LabelNumpad2:
IfWinNotActive, %WindowFocus%
	Return
FuncMacroRestore()
jopa2:=true
ToolTip,Shift Spam, 0, 0
sleep 500
ToolTip
Return
;===============================Jump-LMB-Shift
LabelNumpad3:
IfWinNotActive, %WindowFocus%
	Return
FuncMacroRestore()
jopa3:=true
ToolTip,Jump-LMB-Shift, 0, 0
sleep 500
ToolTip
Return

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
	FuncRandomUlt()
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
FuncRandomUlt()
{
	Random, ScRandomVar1, 1, 4
	if ScRandomVar1 = 1
	{
		SendInput, {vk31 down}
		sleep 340
		SendInput, {vk31 up}
		
	}
	if ScRandomVar1 = 2
	{
		SendInput, {vk32 down}
		sleep 340
		SendInput, {vk32 up}
		
	}
	if ScRandomVar1 = 3
	{
		SendInput, {vk33 down}
		sleep 340
		SendInput, {vk33 up}
		
	}
	if ScRandomVar1 = 4
	{
		SendInput, {vk34 down}
		sleep 340
		SendInput, {vk34 up}
		
	}
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
		FuncRandomSleep()
	}
}
Return
;============================SetTimer Скип диалогов
TimerNpcSkip:
Sleep 100
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
;==========================================Функция сброса
FuncMacroRestore()
{
Global
	Loop 26
	{
		IndexVarL := A_Index - 1
		jopa%IndexVarL% := false
	}
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















