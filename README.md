<div align="center">

# M2VR

**Mafia II Classic in Virtual Reality With 6-DoF Motion Controls**

Head-tracked stereo · hands and weapons on the controllers · a real steering wheel · menus on a fixed screen

![version](https://img.shields.io/badge/version-0.0.4%20alpha-9b1b14)
![platform](https://img.shields.io/badge/Windows-10%20%2F%2011-444)
![api](https://img.shields.io/badge/VR-OpenXR-c8a24a)
![license](https://img.shields.io/badge/license-Freeware-444)

| ⬇ Download | 💬 Discord | ♥ Support the project |
| :---: | :---: | :---: |
| [**Latest version**](../../releases/latest) | [**Join the Discord**](https://discord.gg/P7wEb2h3YE) | [**Donate**](https://ko-fi.com/josevitor11) |
| | Suggestions · Bug reports · Testers | |

[How to use](#how-to-use) · [Controls](#controls)  · [Compatibility](#compatibility) 

</div>

> Mafia 2 was the first game I played as a kid, and it became my favorite. I always wanted to play it in VR, so in my free time I decided to create this mod. This mod is in an early development version, it may have bugs as the story progresses, and more time is needed to test and fix it. But it is already 100% playable.



See the [Releases](../../releases) page for the full notes of each version.

## Implemented features

- **Native 3D stereo.**
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
- **64-bit helper process for the VR runtime**, keeping the game's 32-bit memory free for the game.
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

1. Download and run **`Mafia II Classic VR MOD - Autoinstaller`** from the [Releases](../../releases/latest) page.
2. Follow the instructions. The installer locates the game folder or lets you select the folder that contains `mafia2.exe`, copies the mod files (replacing any files with the same name), automatically detects the game version and applies the necessary patch to make the supported build's executable 100% compatible with M2VR and the 4 GB memory patch, and creates an M2VR Launcher shortcut on the desktop. A backup of the original `mafia2.exe` is saved as `mafia2.exe.bak`, and the uninstaller restores it.

> **Note:** Before starting the game, it is recommended to set all graphics settings to low and then gradually increase them to test performance. If you have an AMD graphics card, keep PhysX disabled.

> **Reinstalling or uninstalling:** close the game and the launcher first. If `m2vr_xrhost.exe` is still running, Windows cannot replace or delete it.

### Manual installation


Copy all files to the directory containing mafia2.exe, then apply the patch:

Patch-Mafia2.exe "Directoryofmafia2/pc/mafia2.exe"

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


## Reporting a bug

Open an *issue* with your `m2vr.log` and describe what you were doing. Issues are public, so check the log before attaching it and do not post personal contact details there.

## Credits and licenses

- **M2VR is freeware.** The source code is **not published yet**; I will organize the code and make it open source in the future. this repository only has the documentation and the Releases. You can redistribute the official package **unmodified**, complete and together with the [LICENSE](LICENSE) and [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) files. See [LICENSE](LICENSE) for the full terms.
- [MinHook](https://github.com/TsudaKageyu/minhook) (BSD 2-Clause), compiled inside `m2vr.asi`.
- Used in the installation, each with its own license: DXVK (zlib), Ultimate ASI Loader (MIT), OpenXR loader (Apache-2.0), jsoncpp (MIT). The installer's 4 GB patch only turns on a flag in the exe header.
- *Mafia II* is a trademark and property of its owners. A fan-made, non-profit project, with no game files.
