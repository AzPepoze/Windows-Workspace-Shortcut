/*
------------------------------------------------------
Script Initialization
-------------------------------------------------------
*/

; --- Configuration ---
; Adjust the path to your DLL file if needed
VDA_PATH := A_ScriptDir . "\VirtualDesktopAccessor.dll"
; Example: VDA_PATH := "C:\Tools\AHK\Libs\VirtualDesktopAccessor.dll"

/*
------------------------------------------------------
Load Configuration
-------------------------------------------------------
*/
IniRead, SwitchDesktop1, config.ini, Hotkeys, SwitchDesktop1
IniRead, SwitchDesktop2, config.ini, Hotkeys, SwitchDesktop2
IniRead, SwitchDesktop3, config.ini, Hotkeys, SwitchDesktop3
IniRead, SwitchDesktop4, config.ini, Hotkeys, SwitchDesktop4
IniRead, SwitchDesktop5, config.ini, Hotkeys, SwitchDesktop5
IniRead, SwitchDesktop6, config.ini, Hotkeys, SwitchDesktop6
IniRead, SwitchDesktop7, config.ini, Hotkeys, SwitchDesktop7
IniRead, SwitchDesktop8, config.ini, Hotkeys, SwitchDesktop8
IniRead, SwitchDesktop9, config.ini, Hotkeys, SwitchDesktop9
IniRead, MoveWindowDesktop1, config.ini, Hotkeys, MoveWindowDesktop1
IniRead, MoveWindowDesktop2, config.ini, Hotkeys, MoveWindowDesktop2
IniRead, MoveWindowDesktop3, config.ini, Hotkeys, MoveWindowDesktop3
IniRead, MoveWindowDesktop4, config.ini, Hotkeys, MoveWindowDesktop4
IniRead, MoveWindowDesktop5, config.ini, Hotkeys, MoveWindowDesktop5
IniRead, MoveWindowDesktop6, config.ini, Hotkeys, MoveWindowDesktop6
IniRead, MoveWindowDesktop7, config.ini, Hotkeys, MoveWindowDesktop7
IniRead, MoveWindowDesktop8, config.ini, Hotkeys, MoveWindowDesktop8
IniRead, MoveWindowDesktop9, config.ini, Hotkeys, MoveWindowDesktop9

/*
------------------------------------------------------
Load DLL
-------------------------------------------------------
*/
hVirtualDesktopAccessor := DllCall("LoadLibrary", "Str", VDA_PATH, "Ptr")

if (!hVirtualDesktopAccessor)
{
    MsgBox, 0x10, VirtualDesktopAccessor Error, Could not load VirtualDesktopAccessor.dll.`n`nPath Tried: %VDA_PATH%`n`nMake sure:`n- The path is correct.`n- The DLL file exists.`n- The DLL version (32/64-bit) matches your AutoHotkey version.
    ExitApp
}

/*
------------------------------------------------------
Get Function Addresses
-------------------------------------------------------
*/
GoToDesktopNumberProc         := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GoToDesktopNumber", "Ptr")
GetCurrentDesktopNumberProc   := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GetCurrentDesktopNumber", "Ptr")
GetDesktopCountProc           := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GetDesktopCount", "Ptr")
CreateDesktopProc             := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "CreateDesktop", "Ptr")
MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "MoveWindowToDesktopNumber", "Ptr")

if (!GoToDesktopNumberProc || !GetCurrentDesktopNumberProc || !GetDesktopCountProc || !CreateDesktopProc || !MoveWindowToDesktopNumberProc)
{
    MsgBox, 0x10, VirtualDesktopAccessor Error, Could not get one or more required function addresses from the DLL.`nMake sure the DLL is not corrupted and is the correct version.
    DllCall("FreeLibrary", "Ptr", hVirtualDesktopAccessor) ; Unload the DLL before exiting
    ExitApp
}

/*
-------------------------------------------------------
Dynamic Hotkey Assignment
-------------------------------------------------------
*/
Hotkey, %SwitchDesktop1%, SwitchToDesktop_1_Label
Hotkey, %SwitchDesktop2%, SwitchToDesktop_2_Label
Hotkey, %SwitchDesktop3%, SwitchToDesktop_3_Label
Hotkey, %SwitchDesktop4%, SwitchToDesktop_4_Label
Hotkey, %SwitchDesktop5%, SwitchToDesktop_5_Label
Hotkey, %SwitchDesktop6%, SwitchToDesktop_6_Label
Hotkey, %SwitchDesktop7%, SwitchToDesktop_7_Label
Hotkey, %SwitchDesktop8%, SwitchToDesktop_8_Label
Hotkey, %SwitchDesktop9%, SwitchToDesktop_9_Label

Hotkey, %MoveWindowDesktop1%, MoveWindow_1_Label
Hotkey, %MoveWindowDesktop2%, MoveWindow_2_Label
Hotkey, %MoveWindowDesktop3%, MoveWindow_3_Label
Hotkey, %MoveWindowDesktop4%, MoveWindow_4_Label
Hotkey, %MoveWindowDesktop5%, MoveWindow_5_Label
Hotkey, %MoveWindowDesktop6%, MoveWindow_6_Label
Hotkey, %MoveWindowDesktop7%, MoveWindow_7_Label
Hotkey, %MoveWindowDesktop8%, MoveWindow_8_Label
Hotkey, %MoveWindowDesktop9%, MoveWindow_9_Label

Return ; End of auto-execute section

/*
-------------------------------------------------------
Hotkey Labels
-------------------------------------------------------
*/

; --- Labels for Switching Desktops ---
SwitchToDesktop_1_Label:
    SwitchToDesktop(1)
Return
SwitchToDesktop_2_Label:
    SwitchToDesktop(2)
Return
SwitchToDesktop_3_Label:
    SwitchToDesktop(3)
Return
SwitchToDesktop_4_Label:
    SwitchToDesktop(4)
Return
SwitchToDesktop_5_Label:
    SwitchToDesktop(5)
Return
SwitchToDesktop_6_Label:
    SwitchToDesktop(6)
Return
SwitchToDesktop_7_Label:
    SwitchToDesktop(7)
Return
SwitchToDesktop_8_Label:
    SwitchToDesktop(8)
Return
SwitchToDesktop_9_Label:
    SwitchToDesktop(9)
Return

; --- Labels for Moving Window and Following ---
MoveWindow_1_Label:
    MoveActiveWindowToDesktopAndFollow(1)
Return
MoveWindow_2_Label:
    MoveActiveWindowToDesktopAndFollow(2)
Return
MoveWindow_3_Label:
    MoveActiveWindowToDesktopAndFollow(3)
Return
MoveWindow_4_Label:
    MoveActiveWindowToDesktopAndFollow(4)
Return
MoveWindow_5_Label:
    MoveActiveWindowToDesktopAndFollow(5)
Return
MoveWindow_6_Label:
    MoveActiveWindowToDesktopAndFollow(6)
Return
MoveWindow_7_Label:
    MoveActiveWindowToDesktopAndFollow(7)
Return
MoveWindow_8_Label:
    MoveActiveWindowToDesktopAndFollow(8)
Return
MoveWindow_9_Label:
    MoveActiveWindowToDesktopAndFollow(9)
Return

/*
-------------------------------------------------------
Core Functions
-------------------------------------------------------
*/

SwitchToDesktop(TargetDesktopNumber)
{
    global GoToDesktopNumberProc, GetDesktopCountProc, CreateDesktopProc

    TargetDesktopIndex := TargetDesktopNumber - 1
    if (TargetDesktopIndex < 0)
        return

    EnsureDesktopExists(TargetDesktopIndex)

    DllCall(GoToDesktopNumberProc, "Int", TargetDesktopIndex, "Int")
    return
}

MoveActiveWindowToDesktopAndFollow(TargetDesktopNumber)
{
    global MoveWindowToDesktopNumberProc, GoToDesktopNumberProc, GetDesktopCountProc, CreateDesktopProc

    WinGet, activeHwnd, ID, A
    if (!activeHwnd)
        return

    TargetDesktopIndex := TargetDesktopNumber - 1
    if (TargetDesktopIndex < 0)
        return

    EnsureDesktopExists(TargetDesktopIndex)

    DllCall(MoveWindowToDesktopNumberProc, "Ptr", activeHwnd, "Int", TargetDesktopIndex, "Int")

    DllCall(GoToDesktopNumberProc, "Int", TargetDesktopIndex, "Int")
    return
}

EnsureDesktopExists(TargetDesktopIndex)
{
    global GetDesktopCountProc, CreateDesktopProc

    DesktopCount := DllCall(GetDesktopCountProc, "Int")

    if (TargetDesktopIndex >= DesktopCount)
    {
        NumDesktopsToCreate := TargetDesktopIndex - DesktopCount + 1

        Loop, % NumDesktopsToCreate
        {
            DllCall(CreateDesktopProc, "Int")
            Sleep, 50
        }
        Sleep, 100
    }
}

/*
-------------------------------------------------------
Script Exit Handling
-------------------------------------------------------
*/

OnExit("Cleanup")

Cleanup(ExitReason, ExitCode)
{
    global hVirtualDesktopAccessor
    if (hVirtualDesktopAccessor)
    {
        DllCall("FreeLibrary", "Ptr", hVirtualDesktopAccessor)
    }
}