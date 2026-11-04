# Security and antivirus notes

## Antivirus false positives

M2VR works by loading a DLL (`m2vr.asi`) into the game through an ASI loader, hooking the Direct3D 9 / OpenXR calls, and patching `mafia2.exe` (4 GB flag and compatibility changes). Antivirus software often flags this kind of behaviour as suspicious even when the files are harmless. The installer and `Patch-Mafia2.exe` are not code-signed yet, so Windows SmartScreen may also warn you the first time.

What you can do:

- Download only from the **Releases** page of this repository.
- If your antivirus blocks a file, add an exclusion for your Mafia II folder, or report it as a false positive to the vendor.
- Do not download M2VR from other sites. They may have modified the files.

## What the installer does

1. Copies the mod files into the folder you choose (the one that contains `mafia2.exe`).
2. Creates `mafia2.exe.bak` (a backup of the original executable) if it does not exist.
3. Runs `Patch-Mafia2.exe "<folder>\mafia2.exe"`.
4. Creates a desktop shortcut to `M2VR-Launcher.exe`.

It does not install services, drivers, startup entries or run in the background, and it does not connect to the internet. The installer script is in `installer/setup.nsi`.

## Reporting a vulnerability

Open a private security advisory on GitHub (Security tab > Report a vulnerability) or contact the author through the profile page.
