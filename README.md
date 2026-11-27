# godot-ps4-homebrew `v3.6`

Clean-room PlayStation 4 homebrew (**OpenOrbis** / **GoldHEN**) export template (`platform/orbis`) and `.pkg` exporter addon for **Godot Engine 3.6**.

> **Target Branch:** Godot `3.6` (`GLES2` / OpenGL ES 2.0).

## Overview

- **Runtime (`platform/orbis/` + `patches/`):** Cross-compiled Godot (`3.6`) export templates targeting Orbis OS via `OpenOrbis-PS4-Toolchain`, Piglet (GLES / EGL), `libSceAudioOut`, and `libScePad`.
- **Editor Addon (`addons/ps4_homebrew_export/`):** Editor export plugin to package `.pck` + Fake SELF (`eboot.bin`) into an installable Fake `.pkg` using `create-fself` and `PkgTool.Core`.
- **Toolchain (`docker/`):** Reproducible Docker environment for cross-compiling templates without requiring proprietary SDKs.

## Quick Commands

```sh
make help        # List available build and utility targets
make toolchain   # Build the OpenOrbis Docker toolchain image
make templates   # Cross-compile Godot 3.6 Orbis export templates
make clean       # Remove local build artifacts
```

## Legal & Clean-Room Notice

This project uses **100% open-source homebrew tools** (`OpenOrbis-PS4-Toolchain`, `PacBrew`, `LibOrbisPkg` / `PkgTool.Core`). No proprietary Sony SDK code, headers, keys, or firmware `.sprx` binaries are used or distributed.

## Branches

| Branch | Godot Version | Renderer (Piglet) |
| :--- | :--- | :--- |
| `4.6` | Godot 4.6 | `gl_compatibility` (GLES 3.0) |
| `3.6` | Godot 3.6 | `GLES2` (OpenGL ES 2.0) |

> When adding a new version branch, update this table in a standalone commit and `git cherry-pick` it onto all other active branches (see [CONTRIBUTING.md](CONTRIBUTING.md)).

## Documentation

- [Architecture Overview](docs/ARCHITECTURE.md)
- [Contributing Guidelines](CONTRIBUTING.md)
- [Security Policy](SECURITY.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)

## License

Licensed under the [MIT License](LICENSE.md).
