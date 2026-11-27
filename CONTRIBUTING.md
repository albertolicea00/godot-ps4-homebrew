# Contributing to godot-ps4-homebrew

Thank you for your interest in contributing!

## Core Rules

1. **100% Clean-Room Open Source:** Only open-source toolchains and libraries (`OpenOrbis-PS4-Toolchain`, `PacBrew`, `LibOrbisPkg` / `PkgTool.Core`) are permitted. Never submit code, headers, tools, or `.sprx` binaries derived from proprietary or leaked SDKs.
2. **Minimal Engine Footprint:** Keep PS4 platform code isolated under `platform/orbis/`. Any required upstream Godot changes must live as minimal `#ifdef ORBIS_ENABLED` patches under `patches/` so maintaining branches across Godot versions stays simple.
3. **Honest Verification:** Clearly state how your change was verified (e.g., cross-compile only, `.pkg` structural check, `shadPS4`, or real PS4 GoldHEN hardware).

## Multi-Branch Workflow

- **`versions` (default branch):** Contains only the general project overview, community governance files, and the directory of supported Godot branches in `README.md`.
- **Version branches (`4.6`, `3.6`, etc.):** Contain the actual implementation (`platform/orbis/`, `patches/`, `addons/`, `docker/`, `Makefile`) for each Godot release.
- **Adding a new Godot version (e.g., `4.7`):**
  1. Branch directly from the closest sibling branch (`git checkout -b 4.7 4.6`) — or from the base template commit when starting a new major family — so ~98% of existing platform code carries over.
  2. Update `thirdparty/godot`, `GODOT_VERSION`, `README.md`, and adapt any changed engine hooks while leaving `4.6` intact for existing users and releases.
  3. Open a PR (or commit) on `versions` adding the new branch to the **Supported Godot Versions** table in `README.md`.
- **Shared changes:** Keep engine-agnostic improvements (`docker/`, `Makefile`, host tools, docs, or shared `platform/orbis/` fixes) in isolated commits and `git cherry-pick` them onto the other active version branches.

## Basic Pull Request Flow

1. Fork the repository and create a feature branch from the target Godot version branch (not `versions`, unless editing general repo docs or the version table).
2. Make focused, minimal changes following Godot C++ / GDScript style conventions.
3. Run `make help` / relevant build checks locally before submitting.
4. Open a Pull Request targeting the corresponding Godot version branch (and note if a `cherry-pick` to sibling branches applies).

By participating, you agree to follow our [Code of Conduct](CODE_OF_CONDUCT.md) and license your contributions under the [MIT License](LICENSE.md).
