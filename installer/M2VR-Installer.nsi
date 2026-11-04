; ============================================================
;  Mafia II Classic VR MOD by josvitorkjr45  -  NSIS Installer
;  Compile with NSIS 3.x (https://nsis.sourceforge.io) - use build.bat
; ============================================================
Unicode true
SetCompressor /SOLID lzma
RequestExecutionLevel admin
ManifestDPIAware true
ShowInstDetails show
ShowUnInstDetails show

!define APPNAME   "Mafia II Classic VR MOD"
!define AUTHOR    "josvitorkjr45"
!define VERSION   "1.0.0.0"
!define UNINSTKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\M2VR_josvitorkjr45"
!define REGKEY    "Software\M2VR_josvitorkjr45"
!define STEAMGAME "Steam\steamapps\common\Mafia II\pc"
!define SAVESDIR  "$LOCALAPPDATA\2K Games\Mafia II\Saves"

Name "${APPNAME} by ${AUTHOR}"
OutFile "Mafia II Classic VR MOD by josvitorkjr45.exe"
BrandingText "Mafia II Classic VR MOD by josvitorkjr45"
InstallDir "$PROGRAMFILES32\${STEAMGAME}"

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"

Var GameDir
Var hDirEdit
Var hStatus
Var Dialog

; ---------- Appearance ----------
!define MUI_ICON   "assets\m2vr.ico"
!define MUI_UNICON "assets\m2vr.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "assets\header.bmp"
!define MUI_HEADERIMAGE_RIGHT
!define MUI_WELCOMEFINISHPAGE_BITMAP   "assets\welcome.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "assets\welcome.bmp"
!define MUI_ABORTWARNING

!define MUI_WELCOMEPAGE_TITLE "Mafia II Classic VR MOD"
!define MUI_WELCOMEPAGE_TEXT "This wizard will install the virtual reality mod for Mafia II Classic.$\r$\n$\r$\nThe installer will copy the mod files to the game folder, patch mafia2.exe, and configure the video settings.$\r$\n$\r$\nPlease close the game before continuing. Click Next."

!define MUI_FINISHPAGE_TITLE "Installation Complete"
!define MUI_FINISHPAGE_TEXT "Mafia II Classic VR MOD has been successfully installed.$\r$\n$\r$\nUse the M2VR Launcher to start the game in VR."
!define MUI_FINISHPAGE_RUN "$INSTDIR\M2VR-Launcher.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Open M2VR Launcher"
!define MUI_FINISHPAGE_RUN_NOTCHECKED

; ---------- Pages ----------
!define MUI_PAGE_CUSTOMFUNCTION_SHOW WelcomeShow
!insertmacro MUI_PAGE_WELCOME
Page custom DirPageCreate DirPageLeave
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

; ---------- File Information (standard metadata) ----------
VIProductVersion "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName"     "${APPNAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName"     "${AUTHOR}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright"  "${AUTHOR}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Installer for ${APPNAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion"     "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion"  "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "OriginalFilename" "Mafia II Classic VR MOD by josvitorkjr45.exe"

Function WelcomeShow
  ; ensures the Next button is enabled when returning from the folder page
  GetDlgItem $0 $HWNDPARENT 1
  EnableWindow $0 1
FunctionEnd

; ============================================================
;  Detect game folder
; ============================================================
Function .onInit
  StrCpy $GameDir ""
  ; 1) default Steam path
  ${If} ${FileExists} "$PROGRAMFILES32\${STEAMGAME}\mafia2.exe"
    StrCpy $GameDir "$PROGRAMFILES32\${STEAMGAME}"
  ${Else}
    ; 2) Steam folder registered in Windows (in case it is on another drive)
    ReadRegStr $0 HKLM "SOFTWARE\Valve\Steam" "InstallPath"
    ${If} $0 != ""
    ${AndIf} ${FileExists} "$0\steamapps\common\Mafia II\pc\mafia2.exe"
      StrCpy $GameDir "$0\steamapps\common\Mafia II\pc"
    ${EndIf}
  ${EndIf}
  ; if not found, $GameDir remains blank for the user to choose
FunctionEnd

; Stack input: path. Stack output: folder containing mafia2.exe, or "".
; (also accepts the "Mafia II" folder, looking in "\pc")
Function ResolveDir
  Exch $R0
  Push $R1
  StrCpy $R1 $R0 1 -1
  ${If} $R1 == "\"
    StrCpy $R0 $R0 -1
  ${EndIf}
  ${If} $R0 == ""
    StrCpy $R1 ""
  ${ElseIf} ${FileExists} "$R0\mafia2.exe"
    StrCpy $R1 $R0
  ${ElseIf} ${FileExists} "$R0\pc\mafia2.exe"
    StrCpy $R1 "$R0\pc"
  ${Else}
    StrCpy $R1 ""
  ${EndIf}
  StrCpy $R0 $R1
  Pop $R1
  Exch $R0
FunctionEnd

; ============================================================
;  Folder selection page
; ============================================================
Function DirPageCreate
  !insertmacro MUI_HEADER_TEXT "Game Folder" "Select the folder where mafia2.exe is located."
  nsDialogs::Create 1018
  Pop $Dialog
  ${If} $Dialog == error
    Abort
  ${EndIf}

  ${NSD_CreateLabel} 0 0 100% 34u "Select the folder where mafia2.exe (the Mafia II executable) is located.$\r$\n$\r$\nOn Steam, it is usually:$\r$\n...\Steam\steamapps\common\Mafia II\pc"
  Pop $0

  ${NSD_CreateGroupBox} 0 42u 100% 34u "Folder containing mafia2.exe"
  Pop $0
  ${NSD_CreateText} 8u 56u 205u 12u "$GameDir"
  Pop $hDirEdit
  ${NSD_OnChange} $hDirEdit DirPageChange
  ${NSD_CreateButton} 219u 55u 62u 14u "Browse..."
  Pop $0
  ${NSD_OnClick} $0 DirPageBrowse

  ${NSD_CreateLabel} 0 84u 100% 24u ""
  Pop $hStatus

  ; main button becomes "Next" (the next page is installation)
  GetDlgItem $0 $HWNDPARENT 1
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Next >"

  Call ValidateDir
  nsDialogs::Show
FunctionEnd

Function ValidateDir
  ${NSD_GetText} $hDirEdit $0
  Push $0
  Call ResolveDir
  Pop $1
  GetDlgItem $2 $HWNDPARENT 1
  ${If} $1 == ""
    EnableWindow $2 0
    ${If} $0 == ""
      ${NSD_SetText} $hStatus "Click Browse and choose the folder where mafia2.exe is located."
    ${Else}
      ${NSD_SetText} $hStatus "The mafia2.exe file was not found in this folder."
    ${EndIf}
  ${Else}
    EnableWindow $2 1
    ${NSD_SetText} $hStatus "mafia2.exe found. Click Next to install."
  ${EndIf}
FunctionEnd

Function DirPageChange
  Pop $0
  Call ValidateDir
FunctionEnd

Function DirPageBrowse
  Pop $0
  ${NSD_GetText} $hDirEdit $0
  nsDialogs::SelectFolderDialog "Select the folder where mafia2.exe is located" "$0"
  Pop $0
  ${If} $0 != error
    ${NSD_SetText} $hDirEdit $0
  ${EndIf}
FunctionEnd

Function DirPageLeave
  ${NSD_GetText} $hDirEdit $0
  Push $0
  Call ResolveDir
  Pop $GameDir
  ${If} $GameDir == ""
    MessageBox MB_ICONEXCLAMATION|MB_OK "The mafia2.exe file was not found in the specified folder."
    Abort
  ${EndIf}
  StrCpy $INSTDIR $GameDir
FunctionEnd

; ============================================================
;  Installation
; ============================================================
Section "Install" SecMain
  SetOverwrite on
  SetOutPath "$INSTDIR"

  ; --- backup original mafia2.exe (only the first time) ---
  ; On reinstall, the patch is applied over the original exe restored from backup.
  DetailPrint "Creating backup of mafia2.exe..."
  ${If} ${FileExists} "$INSTDIR\mafia2.exe.bak"
    CopyFiles /SILENT "$INSTDIR\mafia2.exe.bak" "$INSTDIR\mafia2.exe"
  ${Else}
    CopyFiles /SILENT "$INSTDIR\mafia2.exe" "$INSTDIR\mafia2.exe.bak"
    ${IfNot} ${FileExists} "$INSTDIR\mafia2.exe.bak"
      MessageBox MB_ICONSTOP|MB_OK "Could not write to the game folder.$\r$\nPlease close the game and run the installer as administrator."
      Abort
    ${EndIf}
  ${EndIf}

  ; --- mod files ---
  DetailPrint "Copying mod files to $INSTDIR"
  File "files\openxr_loader.dll"
  File "files\d3d9.dll"
  File "files\dinput8.dll"
  File "files\jsoncpp.dll"
  File "files\m2vr.asi"
  File "files\m2vr.ini"
  File "files\m2vr_ini.padrao-do-lancador"
  File "files\M2VR-Launcher.exe"

  ; --- patch mafia2.exe: Patch-Mafia2.exe "<folder>\mafia2.exe" ---
  InitPluginsDir
  SetOutPath "$PLUGINSDIR"
  File "files\Patch-Mafia2.exe"
  DetailPrint "Applying patch to mafia2.exe..."
  ExecWait '"$PLUGINSDIR\Patch-Mafia2.exe" "$INSTDIR\mafia2.exe"' $0
  DetailPrint "Patch completed (exit code: $0)"
  ${If} $0 != 0
    MessageBox MB_ICONEXCLAMATION|MB_OK "The patch finished with code $0.$\r$\nIf the mod does not work, the original mafia2.exe is saved as mafia2.exe.bak."
  ${EndIf}
  Delete "$PLUGINSDIR\Patch-Mafia2.exe"
  SetOutPath "$INSTDIR"

  ; --- videoconfig.cfg in AppData\Local\2K Games\Mafia II\Saves ---
  DetailPrint "Configuring video (videoconfig.cfg)..."
  SetShellVarContext current
  ${If} ${FileExists} "${SAVESDIR}\videoconfig.cfg"
  ${AndIfNot} ${FileExists} "${SAVESDIR}\videoconfig.cfg.bak"
    CopyFiles /SILENT "${SAVESDIR}\videoconfig.cfg" "${SAVESDIR}\videoconfig.cfg.bak"
  ${EndIf}
  SetOutPath "${SAVESDIR}"
  File "files\videoconfig.cfg"
  SetOutPath "$INSTDIR"

  ; --- uninstaller and registry (Windows standard) ---
  DetailPrint "Registering uninstaller..."
  WriteUninstaller "$INSTDIR\Uninstall-M2VR.exe"
  WriteRegStr HKLM "${REGKEY}" "InstallDir" "$INSTDIR"
  WriteRegStr HKLM "${UNINSTKEY}" "DisplayName"          "${APPNAME} by ${AUTHOR}"
  WriteRegStr HKLM "${UNINSTKEY}" "DisplayVersion"       "${VERSION}"
  WriteRegStr HKLM "${UNINSTKEY}" "Publisher"            "${AUTHOR}"
  WriteRegStr HKLM "${UNINSTKEY}" "InstallLocation"      "$INSTDIR"
  WriteRegStr HKLM "${UNINSTKEY}" "DisplayIcon"          "$INSTDIR\M2VR-Launcher.exe"
  WriteRegStr HKLM "${UNINSTKEY}" "UninstallString"      '"$INSTDIR\Uninstall-M2VR.exe"'
  WriteRegStr HKLM "${UNINSTKEY}" "QuietUninstallString" '"$INSTDIR\Uninstall-M2VR.exe" /S'
  WriteRegDWORD HKLM "${UNINSTKEY}" "NoModify" 1
  WriteRegDWORD HKLM "${UNINSTKEY}" "NoRepair" 1

  ; --- Start Menu shortcuts ---
  SetShellVarContext all
  CreateDirectory "$SMPROGRAMS\${APPNAME}"
  CreateShortcut "$SMPROGRAMS\${APPNAME}\M2VR Launcher.lnk" "$INSTDIR\M2VR-Launcher.exe"
  CreateShortcut "$SMPROGRAMS\${APPNAME}\Uninstall.lnk" "$INSTDIR\Uninstall-M2VR.exe"

  ; --- desktop shortcut ---
  DetailPrint "Creating desktop shortcut..."
  SetOutPath "$INSTDIR"
  CreateShortcut "$DESKTOP\M2VR-Launcher.lnk" "$INSTDIR\M2VR-Launcher.exe" "" "$INSTDIR\M2VR-Launcher.exe" 0
  SetShellVarContext current
SectionEnd

; ============================================================
;  Uninstallation
; ============================================================
Section "Uninstall"
  ReadRegStr $0 HKLM "${REGKEY}" "InstallDir"
  ${If} $0 != ""
    StrCpy $INSTDIR $0
  ${EndIf}

  Delete "$INSTDIR\openxr_loader.dll"
  Delete "$INSTDIR\d3d9.dll"
  Delete "$INSTDIR\dinput8.dll"
  Delete "$INSTDIR\jsoncpp.dll"
  Delete "$INSTDIR\m2vr.asi"
  Delete "$INSTDIR\m2vr.ini"
  Delete "$INSTDIR\m2vr_ini.padrao-do-lancador"
  Delete "$INSTDIR\M2VR-Launcher.exe"

  ; restores original mafia2.exe
  ${If} ${FileExists} "$INSTDIR\mafia2.exe.bak"
    DetailPrint "Restoring original mafia2.exe..."
    CopyFiles /SILENT "$INSTDIR\mafia2.exe.bak" "$INSTDIR\mafia2.exe"
    Delete "$INSTDIR\mafia2.exe.bak"
  ${EndIf}

  ; restores previous videoconfig.cfg (if it existed)
  SetShellVarContext current
  ${If} ${FileExists} "${SAVESDIR}\videoconfig.cfg.bak"
    CopyFiles /SILENT "${SAVESDIR}\videoconfig.cfg.bak" "${SAVESDIR}\videoconfig.cfg"
    Delete "${SAVESDIR}\videoconfig.cfg.bak"
  ${Else}
    Delete "${SAVESDIR}\videoconfig.cfg"
  ${EndIf}

  SetShellVarContext all
  Delete "$SMPROGRAMS\${APPNAME}\M2VR Launcher.lnk"
  Delete "$SMPROGRAMS\${APPNAME}\Uninstall.lnk"
  RMDir  "$SMPROGRAMS\${APPNAME}"
  Delete "$DESKTOP\M2VR-Launcher.lnk"
  SetShellVarContext current

  DeleteRegKey HKLM "${UNINSTKEY}"
  DeleteRegKey HKLM "${REGKEY}"
  Delete "$INSTDIR\Uninstall-M2VR.exe"
SectionEnd