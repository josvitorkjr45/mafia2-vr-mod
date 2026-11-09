<div align="center">

# M2VR

**Mafia II Classic in Virtual Reality With 6-DoF Motion Controls**

Head-tracked stereo · hands and weapons on the controllers · a real steering wheel · menus on a fixed screen

![version](https://img.shields.io/badge/version-0.0.3%20alpha-9b1b14)
![platform](https://img.shields.io/badge/Windows-10%20%2F%2011-444)
![api](https://img.shields.io/badge/VR-OpenXR-c8a24a)
![license](https://img.shields.io/badge/license-Freeware-444)

| ⬇ Download | ♥ Support the project |
| :---: | :---: |
| [**Latest version**](../../releases/latest) | [**Donate**](https://ko-fi.com/josevitor11) |

[How to use](#how-to-use) · [Controls](#controls) · [What is missing or untested](#not-yet-implemented-or-tested-bugs-i-noticed) · [Compatibility](#compatibility) · [Bugs](#not-yet-implemented-or-tested-bugs-i-noticed) · [Português](README.pt-BR.md)

</div>

> Mafia 2 was the first game I played as a kid, and it became my favorite. I always wanted to play it in VR, so in my free time I decided to create this mod. This mod is in an early development version, it may have bugs as the story progresses, and more time is needed to test and fix it. But it is already 100% playable.

---

## Implemented features

- **Native 3D stereo (beta), optional AFR.**
- **6DoF head tracking.**
- **Motion controls with 6-DOF:** use the headset controllers to aim, shoot, reload manually, fight and drive.
- **Hand poses and inverse kinematics (IK) for the arms.**
- **HUD adapted to virtual reality.** Use your wrist to see the map HUD.
- **Driving system adapted for virtual reality:** steering wheel controlled by the hands (but it can also be turned using the thumbsticks), lockpick to unlock cars, radio station switching and horn by gesture.
- **Weapon switching by movements**, inspired by *Half-Life: Alyx*.
- **OpenXR and SteamVR compatibility.** Tested with the Quest 2; there are resolution and controller profiles for other headsets, **not yet tested.**
- **Manual reload for all weapons** (still needs polish).
- **Combat system adapted for virtual reality.** You can use your hands to throw punches or use the controller triggers (still needs polish).
- **FXAA antialiasing (beta).**
- **Cutscenes and selection menus in flat mode to avoid motion sickness.**

## Compatibility

> **IMPORTANT:** Mafia II Classic is a 32-bit game, and the executable needs the 4 GB patch so the executable can use 4 GB of RAM and thus the mod works correctly. M2VR was developed for version 1.0.0.1 Complete Edition and depends on fixed addresses in the executable to hook, used by (the camera, the shots, the reloads, the characters' bones and the menus — besides reading data at specific positions). The Steam version also works, but showed several bugs in testing. To solve these problems, I created a patch `Patch-Mafia2.exe`, which applies the 4 GB RAM support patch and makes the compatibility adjustments needed for the Steam executable or other 1.0.0.1 editions, making the Steam version 100% compatible with the mod.

| Item | Status |
| --- | --- |
| Meta Quest 2 + Virtual Desktop | **Tested** |
| Quest 2 via SteamVR | The VR session opened and the controllers worked **Tested** |
| Quest 3 / 3S / Pro, Pico 4, Index, Reverb G2, Vive Pro 2, Beyond, PSVR2 | Although there are controller and resolution profiles in the launcher for these devices, I don't know how they behave in practice, bugs may occur. |
| `mafia2.exe` **1.0.0.1** **Digital Deluxe Edition** (100% compatible) | (4 GB RAM patch must be applied) |
| `mafia2.exe` **1.0.0.1** **Steam Version** (100% compatible with custom patch) | Because of the way the mod was made, the protected executable version, although it works, has many bugs, so I created a patch for the Steam Mafia 2 executable that applies the 4 GB RAM patch and modifies some sections of the executable and makes it 100% compatible with the mod. |
| Mafia II Definitive Edition | Not supported |

Requirements: Windows 10/11, a Vulkan GPU (because of DXVK), an active **32-bit** OpenXR runtime (Virtual Desktop, Meta Link or SteamVR), Install the Microsoft Visual C++ Redistributable 2015–2022 (x86) (https://aka.ms/vc14/vc_redist.x86.exe) before launching M2VR.

## How to use

### Automatic installation (recommended)

1. Download and run **`M2VR-Installer-0.0.2.exe`**.
2. Follow the instructions (the installer is in Portuguese: **Avançar** = Next, **Eu concordo** = I Agree). The installer locates the game folder or lets you select the folder that contains `mafia2.exe`, copies the mod files, automatically detects the game version and applies the necessary patch to make the supported build's executable 100% compatible with M2VR and the 4 GB memory patch, and creates an M2VR Launcher shortcut on the desktop.

> **Note:**  Before starting the game, it is recommended to set all graphics settings to low and then gradually increase them to test performance. If you have an AMD graphics card, keep PhysX disabled.


### Manual installation

Copy these files to the folder where `mafia2.exe` is:

| File | Function | Source |
| --- | --- | --- |
| `m2vr.asi` | VR mod | **ZIP** package from the Releases page |
| `M2VR-Launcher.exe` | M2VR launcher | same ZIP |
| `m2vr.ini` | configuration file | same ZIP |
| `dinput8.dll` | loads `m2vr.asi` | [Ultimate ASI Loader](https://github.com/ThirteenAG/Ultimate-ASI-Loader) (32-bit) |
| `d3d9.dll` | runs Direct3D 9 over Vulkan | [DXVK](https://github.com/doitsujin/dxvk) (32-bit) |
| `openxr_loader.dll` + `jsoncpp.dll` | OpenXR loader files | [OpenXR-SDK](https://github.com/KhronosGroup/OpenXR-SDK) (32-bit) |
| `Patch-Mafia2.exe` "Directory Mafia2/pc" | applies the compatibility patches and the 4 GB patch | M2VR package |

## Controls

> **Note:** In the first chapter there are a few tutorials to progress in the game. To climb up the initial window, press the left trigger; then the game asks you to take cover at the corner of the door to progress, just get close and press A to enter cover mode, then you can leave.

**On foot**

| Control | Action |
| --- | --- |
| Left thumbstick | walk: slightly tilted = slow, medium = normal, all the way (or click) = run |
| Right thumbstick | turn the camera (or turn your body; the character follows the view) |
| Right trigger | shoot |
| Left trigger | **Space** (vault over obstacle / dodge). |
| Left grip | hold the weapon with two hands; grab the magazine from the belt |
| Right thumbstick click + move the hand | switch weapon |
| **X** (left) | **1 tap** = (enter the car normally); **2 quick taps** = (break the car window and get in); **3 or more** = (get into the car by bypassing the door using lockpick); **hold 3 s** = (go to the Main Menu) |
| **B** (right) | tap = F, hold = held F, 2 taps = Q |
| **A** (right) | interact (E); 3 quick taps = Q |
| **Y** (left) | map |

**Fighting (no weapon in hand)**

| Control | Action |
| --- | --- |
| Hands together at the face | defense / dodge |
| Right grip + punch with the hand | **weak** punch |
| Left grip + punch with the hand | **strong** punch |
| Right grip + right trigger (You need to take your hands away from the face area to leave dodge mode) | **weak** punch by button |
| Left grip + left trigger (You need to take your hands away from the face area to leave dodge mode) | **strong** punch by button |

**Weapons and reloading**

| Gesture | Action |
| --- | --- |
| Magazine empty | move your left hand to the belt, close the grip to grab the magazine and **insert it in the weapon** |
| After the magazine | hold the weapon part (bolt/slide) with the left grip, pull it back and release to cock |
| Shotgun | put in the shells and pull the barrel back to pump |
| Grenade / molotov | hold the right grip to prepare, throw with your hands with the right trigger (Needs polish) |

**In the car**

| Control | Action |
| --- | --- |
| Hands on the wheel + grip (left hand or right hand or both for more stability) + squeeze the trigger to decrease or increase the car's speed (left trigger reverses, right trigger accelerates) or you can use the left thumbstick to turn the wheel | drive (releasing the grip releases the wheel) |
| Right / left trigger | accelerate / brake and reverse |
| Hand on the center of the wheel | horn |
| Right hand on the radio button + grip, turn | change station |
| X (1 tap) / A | exit |
| Lockpick (locked door) | X several times in a row; then raise your right hand to lift the latch and press **A** at the right moment |

**In menus:** point with the right controller (it becomes the mouse), if it bugs out you can also move the cursor with the right thumbstick, **A** or the right trigger click, **B** goes back, to center the camera on the body hold the default left menu shortcut for a few seconds or F10.

## Not yet implemented or tested, Bugs I noticed

| Item | Status |
| --- | --- |
| **Without the 4 GB patch** | does not run; reducing the mod's memory usage to fit in 2 GB is a future idea |
| **Other headsets** (Quest 3/Pro, Pico 4, Index, Reverb G2, Vive Pro 2, Beyond, PSVR2) | profiles exist in the launcher, **nothing tested** |
| **Configurable trigger and grip sensitivity** | today the activation point is fixed; planned |
| **In-game settings menu** | does not exist; use the launcher and `m2vr.ini` |
| **Cursor in menus, purchases and map** | We recommend moving the cursor with the thumbstick. Control by hand movement may still fail. |
| **Camera in fight finishers** | Sometimes the camera ends with the wrong rotation. |
| **Mafia II Definitive Edition** (64-bit) | not supported; it would be a separate mod |
| **Linux / Wine** | not tested |
| **Realistic cover system that follows the player's height** | Will be implemented in upcoming updates |

The game is still in an early testing phase. There are some bugs, but they do not prevent playing the entire main campaign; I continue working on the fixes.

## Credits and licenses

- **M2VR is freeware.** The source code is **not published yet**; I will organize the code and make it open source in the future. this repository only has the documentation and the Releases. You can redistribute the official package **unmodified**, complete and together with the [LICENSE](LICENSE) and [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) files. See [LICENSE](LICENSE) for the full terms.
- [MinHook](https://github.com/TsudaKageyu/minhook) (BSD 2-Clause), compiled inside `m2vr.asi`.
- Used in the installation, each with its own license: DXVK (zlib), Ultimate ASI Loader (MIT), OpenXR loader (Apache-2.0), jsoncpp (MIT). The installer's 4 GB patch only turns on a flag in the exe header.
- *Mafia II* is a trademark and property of its owners. A fan-made, non-profit project, with no game files.
