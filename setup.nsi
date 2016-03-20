; Simple CK2 mod manual installer for Windows

; To generate the installer, download NSIS Unicode 2.46.5 from https://code.google.com/p/unsis/downloads/list
; and launch "Compile NSIS Unicode script" from context menu.
; Unicode is needed to support French accents.
; NSIS documentation:
; - MUI: http://nsis.sourceforge.net/Docs/Modern%20UI/Readme.html
; - Scripting reference: http://nsis.sourceforge.net/Docs/Chapter4.html

!include "MUI2.nsh"

; Mod configuration defined in .mod file, to know which folders to cleanup.
!define mod_path "WTWSMS"
!define mod_user_dir "WTWSMS"

; The name of the installer
Name "WtWSMS"

; The file to write
OutFile "WtWSMS-setup.exe"

; The default installation directory
InstallDir "$DOCUMENTS\Paradox Interactive\Crusader Kings II\mod"

; Request application privileges for Windows Vista
RequestExecutionLevel user

; ---------------------------
; Pages: Language -> Welcome -> Directory -> Install -> Finish
; ---------------------------

!define MUI_WELCOMEPAGE_TITLE $(MUI_WELCOMEPAGE_TITLE)
!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_WELCOMEPAGE_TEXT $(MUI_WELCOMEPAGE_TEXT)
!insertmacro MUI_PAGE_WELCOME

; To simplify, do not display components page: all are installed
;!insertmacro MUI_PAGE_COMPONENTS

!define MUI_DIRECTORYPAGE_TEXT_DESTINATION $(MUI_DIRECTORYPAGE_TEXT_DESTINATION)
!insertmacro MUI_PAGE_DIRECTORY

!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_TITLE $(MUI_FINISHPAGE_TITLE)
!define MUI_FINISHPAGE_TEXT $(MUI_FINISHPAGE_TEXT)
!define MUI_FINISHPAGE_TEXT_LARGE
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\ChangeLog.txt"
;!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_SHOWREADME_TEXT $(MUI_FINISHPAGE_SHOWREADME_TEXT)
!define MUI_FINISHPAGE_LINK $(MUI_FINISHPAGE_LINK)
!define MUI_FINISHPAGE_LINK_LOCATION "http://forum.paradoxplaza.com/forum/forumdisplay.php?876-When-the-World-Stopped-Making-Sense-Mod"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!insertmacro MUI_PAGE_FINISH

;Languages - needs to be after page declarations
!insertmacro MUI_LANGUAGE English ;First language is the default if a better match is not found
!insertmacro MUI_LANGUAGE French
!insertmacro MUI_LANGUAGE Spanish

; Display Language selection dialog
Function .onInit

  !insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

; Un-install main mod 
Section "Uninstall previous"

  ; Remove directories and files recursively
  ; Only delete <path> folder of main mod, in case some files are removed from folders
  ; .mod files and other sub-mod files will always get overwritten during install.
  RMDir /r "$INSTDIR\${mod_path}"

SectionEnd

; Clean gfx cache
Section "Clean gfx cache"

  ; Delete <user_dir>/gfx folder
  RMDir /r "$INSTDIR\..\${mod_user_dir}\gfx"

SectionEnd

;--------------------------------

; Install mod and sub-mods
Section "Install"

  ; Set output path to the installation directory.
  SetOutPath "$INSTDIR"
  
  ; Copy mod files (excluding configuration files)
  File "ChangeLog.txt" ; Copy changelog to open it after installation
  File "*.mod" ; Copy all .mod descriptors
  File /r /x "*.exe" "${mod_path}*" ; Note: sub-mod paths start with same as main mod path
  
SectionEnd

; ---------------------------
; Localization
; ---------------------------

; English
LangString MUI_WELCOMEPAGE_TITLE ${LANG_ENGLISH} "When the World Stopped Making Sense...$\r$\n \
A Dark Ages mod for CK2!"
LangString MUI_WELCOMEPAGE_TEXT ${LANG_ENGLISH} "This installer will:$\r$\n \
1) Remove any previously installed version of the mod$\r$\n \
2) Clean the mod gfx cache$\r$\n \
3) Install the mod to your mod folder$\r$\n"
LangString MUI_DIRECTORYPAGE_TEXT_DESTINATION ${LANG_ENGLISH} "Please select your CK2 mod folder"
LangString MUI_FINISHPAGE_TITLE ${LANG_ENGLISH} "WtWSMS has been installed"
LangString MUI_FINISHPAGE_TEXT ${LANG_ENGLISH} "To play:$\r$\n \ 
- Open CK2 launcher.$\r$\n \
- Select the mod 'When the World Stopped Making Sense' in the Mod tab of the launcher.$\r$\n \
- Select ONLY the WTWSMS graphical sub-mods for which you own the required graphical DLCs.$\r$\n \
- Enjoy !$\r$\n"
LangString MUI_FINISHPAGE_SHOWREADME_TEXT ${LANG_ENGLISH} "Open the Changelog"
LangString MUI_FINISHPAGE_LINK ${LANG_ENGLISH} "Go to WtWSMS forum"

; French
LangString MUI_WELCOMEPAGE_TITLE ${LANG_FRENCH} "Quand le Monde a Arrêté d'Avoir un Sens...$\r$\n \
Un mod pour CK2 sur l'Âge Sombre !"
LangString MUI_WELCOMEPAGE_TEXT ${LANG_FRENCH} "Cet installateur va:$\r$\n \
1) Supprimer toute ancienne version du mod precédement installée$\r$\n \
2) Vider votre cache de gfx du mod$\r$\n \
3) Installer le mod dans votre répertoire de mods$\r$\n"
LangString MUI_DIRECTORYPAGE_TEXT_DESTINATION ${LANG_FRENCH} "Merci de sélectionner votre répertoire de mods CK2"
LangString MUI_FINISHPAGE_TITLE ${LANG_FRENCH} "WtWSMS a été installé"
LangString MUI_FINISHPAGE_TEXT ${LANG_FRENCH} "Pour jouer:$\r$\n \ 
- Lancez CK2.$\r$\n \
- Sélectionnez le mod 'When the World Stopped Making Sense' dans l'onglet mod.$\r$\n \
- Sélectionnez UNIQUEMENT les sous-mods graphiques pour WTWSMS pour lesquels vous possédez les DLCs requis.$\r$\n \
- Profitez !$\r$\n"
LangString MUI_FINISHPAGE_SHOWREADME_TEXT ${LANG_FRENCH} "Ouvrir le notes de changements (en anglais)"
LangString MUI_FINISHPAGE_LINK ${LANG_FRENCH} "Accéder au forum WtWSMS"

; Spanish
LangString MUI_WELCOMEPAGE_TITLE ${LANG_SPANISH} "Cuando el Mundo ha Terminado Tener Sentido...$\r$\n \
Un mod para CK2 sobre la Edad Obscura !"
LangString MUI_WELCOMEPAGE_TEXT ${LANG_SPANISH} "Està instalador va:$\r$\n \
1) Sacar toda vieja versión del mod anteriormente instalada$\r$\n \
2) Limpiar el cache de gfx del mod$\r$\n \
3) Instalar el mod en el repertorio de mods$\r$\n"
LangString MUI_DIRECTORYPAGE_TEXT_DESTINATION ${LANG_SPANISH} "Merci de sélectionner votre répertoire de mods CK2"
LangString MUI_FINISHPAGE_TITLE ${LANG_SPANISH} "WtWSMS ha instalado"
LangString MUI_FINISHPAGE_TEXT ${LANG_SPANISH} "Para jugar:$\r$\n \ 
- Lanza CK2.$\r$\n \
- Selecciona el mod 'When the World Stopped Making Sense' en la sección mod.$\r$\n \
- Selecciona SOLAMENTE los sub-mods gráficos para WTWSMS para cual tenéis los DLCs obligatorios.$\r$\n \
- ¡Diviértete!$\r$\n"
LangString MUI_FINISHPAGE_SHOWREADME_TEXT ${LANG_SPANISH} "Abrir el Changelog (en inglès)"
LangString MUI_FINISHPAGE_LINK ${LANG_SPANISH} "Acceder al forum WtWSMS"

