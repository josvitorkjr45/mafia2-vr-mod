# Installer

`setup.nsi` is the [NSIS](https://nsis.sourceforge.io/) script that builds the installer.

To build it, place these files in a `payload/` folder next to the script (they are not stored in this repository):
`M2VR-Launcher.exe`, `m2vr.asi`, `m2vr.ini`, `m2vr_ini.padrao-do-lancador`, `d3d9.dll`, `dinput8.dll`, `jsoncpp.dll`, `openxr_loader.dll`, `Patch-Mafia2.exe`,
plus `nsis_icon.ico`, `header.bmp` and `welcome.bmp`, then run `makensis setup.nsi`.

The script also packs `LICENSE`, `THIRD_PARTY_LICENSES.md` and `licenses/*.txt` straight from the repository root (paths `..\LICENSE` etc.), so build it with the repository checked out. They are installed in `M2VR-licenses/` inside the game folder.
