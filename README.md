# godot-ps4-homebrew

Clean-room PlayStation 4 homebrew (**OpenOrbis** / **GoldHEN**) export templates (`platform/orbis`) and one-click Fake `.pkg` exporter addon for **Godot Engine**.

> **Branch Index (`versions`):** Because Godot `.pck` packages require a matching engine runtime version, each supported Godot release lives on its own dedicated branch. Select your Godot version below to view its source, build tools, and documentation.

## Supported Godot Versions

| Branch | Godot Version | Renderer (Piglet) | Status |
| :--- | :--- | :--- | :--- |
| [`4.6`](../../tree/4.6) | Godot 4.6 | `gl_compatibility` (OpenGL ES 3.0) | Planned / Scaffold |
| [`3.6`](../../tree/3.6) | Godot 3.6 | `GLES2` (OpenGL ES 2.0) | Planned / Scaffold |

```sh
# Clone a specific Godot version branch directly:
git clone -b 4.6 https://github.com/albertolicea00/godot-ps4-homebrew.git
```

## Supporting New Godot Releases (e.g. `4.7+`)

When a new Godot release comes out:

1. Create the new branch from the closest sibling branch (e.g., `git checkout -b 4.7 4.6`) to reuse existing platform code and addon tooling.
2. Update `thirdparty/godot`, `GODOT_VERSION`, and any minimal `#ifdef ORBIS_ENABLED` patches, while keeping `4.6` frozen for users still on that version.
3. Register the new branch in the table above on `versions`, and use `git cherry-pick` to share engine-agnostic fixes across active branches (see [CONTRIBUTING.md](CONTRIBUTING.md)).

## What's Inside Each Version Branch

- **Runtime (`platform/orbis/` + `patches/`):** Cross-compiled Godot export templates targeting Orbis OS via `OpenOrbis-PS4-Toolchain`, Piglet (GLES / EGL), `libSceAudioOut`, and `libScePad`.
- **Editor Addon (`addons/ps4_homebrew_export/`):** Editor export plugin to package `.pck` + Fake SELF (`eboot.bin`) into an installable Fake `.pkg` using `create-fself` and `PkgTool.Core`.
- **Toolchain (`docker/`):** Reproducible Docker environment for cross-compiling templates without requiring proprietary SDKs.

## Legal & Clean-Room Notice

This project uses **100% open-source homebrew tools** (`OpenOrbis-PS4-Toolchain`, `PacBrew`, `LibOrbisPkg` / `PkgTool.Core`). No proprietary Sony SDK code, headers, keys, or firmware `.sprx` binaries are used or distributed.

## Community & Governance

- [Contributing Guidelines](CONTRIBUTING.md)
- [Security Policy](SECURITY.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [MIT License](LICENSE.md)
