# Architecture Overview

`godot-ps4-homebrew` provides an open-source PlayStation 4 (Orbis OS / GoldHEN) export target and `.pkg` packaging plugin for **Godot Engine 3.6**.

> **Target Branch:** Godot `3.6` (`thirdparty/godot` pinned to `3.6`, using the `GLES2` OpenGL ES 2.0 renderer over Piglet).

## 1. Design Constraints

- **Clean-Room Toolchain:** Built strictly with `OpenOrbis-PS4-Toolchain` (`Clang x86_64-scei-ps4`), `PacBrew` libraries, and `LibOrbisPkg` (`PkgTool.Core`).
- **Dynamic System Modules:** Console graphics modules (`libScePigletv2VSH.sprx` and `libSceShaccVSH.sprx`) are loaded at runtime from `/system/common/lib/` on the PS4 and are never bundled in the repository or `.pkg`.
- **Upgradeable Layout:** Upstream Godot (`3.6`) stays unmodified as a submodule (`thirdparty/godot`). PS4 code lives in `platform/orbis/`, with minimal `#ifdef ORBIS_ENABLED` adjustments stored in `patches/`.

## 2. Planned Repository Structure

```text
godot-ps4-homebrew/
├── addons/ps4_homebrew_export/  # Editor export plugin (.pkg exporter)
├── docker/                      # OpenOrbis + PacBrew cross-compile container
├── docs/                        # Architecture & technical notes
├── patches/                     # Minimal #ifdef ORBIS_ENABLED engine patches
├── platform/orbis/              # OS, Video/Display, Audio, Joypad backends
├── samples/                     # Smoke-test Godot 3.6 project
└── thirdparty/godot/            # Pinned Godot 3.6 submodule
```

## 3. Runtime Subsystems (`platform/orbis/`)

| Component | Orbis / Homebrew API | Responsibility |
| :--- | :--- | :--- |
| OS Backend | POSIX (`OS_Unix`) + `libkernel` | Process lifecycle, `res://` -> `/app0/eboot.pck`, `user://` -> `/data/<slug>/`, `klog` output |
| Video / Display | `libSceVideoOut` + `Piglet` (EGL/GLES) | 1080p/720p surface initialization, `Shacc` runtime shader setup, Godot GLES2 renderer binding |
| Audio Driver | `libSceAudioOut` | 48 kHz stereo PCM audio output |
| Joypad Driver | `libScePad` | Buttons, analog sticks/triggers, vibration, LED light bar, 6-axis motion/gyro |

## 4. `.pkg` Export Flow (`addons/ps4_homebrew_export/`)

1. Export Godot (`3.6`) project resources to `eboot.pck`.
2. Convert prebuilt Orbis Godot template (`*.elf`) into a Fake SELF (`eboot.bin`) via `create-fself`.
3. Generate `sce_sys/param.sfo`, 24-bit RGB PNG icons (`icon0.png`, `pic1.png`), and `project.gp4`.
4. Build the installable Fake PKG (`<game>.pkg`) via `PkgTool.Core`.

## 5. Planned Stages

0. **Discovery & GLES/Piglet Audit:** Verify headers, symbols, and shader constraints for Godot `3.6`.
1. **Toolchain & PoC:** Docker image + standalone C++ Piglet/Pad/Audio Fake `.pkg`.
2. **Headless Core:** Cross-compile OS backend with dummy drivers and `.pck` boot.
3. **Graphics:** Piglet EGL + Godot `3.6` GLES2 renderer bring-up and compatibility patches.
4. **Audio & Input:** Native audio + `libScePad` (rumble, LED, gyro).
5. **Editor Addon & CI:** One-click `.pkg` export from Godot `3.6` + sample project + GitHub Actions.
