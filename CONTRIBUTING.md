# Contributing to godot-ps4-homebrew

Thank you for your interest in contributing!

## Core Rules

1. **100% Clean-Room Open Source:** Only open-source toolchains and libraries (`OpenOrbis-PS4-Toolchain`, `PacBrew`, `LibOrbisPkg` / `PkgTool.Core`) are permitted. Never submit code, headers, tools, or `.sprx` binaries derived from proprietary or leaked SDKs.
2. **Minimal Engine Footprint:** Keep PS4 platform code isolated under `platform/orbis/`. Any required upstream Godot changes must live as minimal `#ifdef ORBIS_ENABLED` patches under `patches/` so maintaining branches across Godot versions stays simple.
3. **Honest Verification:** Clearly state how your change was verified (e.g., cross-compile only, `.pkg` structural check, `shadPS4`, or real PS4 GoldHEN hardware).

## Branching & Cherry-Pick Workflow

Each supported Godot release lives on its own branch (e.g., `4.6`, `3.6`) derived from the base template commit:

- **Adding a new Godot version branch:**
  1. Branch from the base template commit (or from the closest sibling version branch).
  2. Replace `??` version placeholders, pin `thirdparty/godot`, and adapt patches.
  3. Add the new branch row to the **Branches** table in `README.md` as a standalone commit, then `git cherry-pick` that commit onto all other active branches so the branch index stays in sync everywhere.
- **Shared improvements (`docker/`, `Makefile`, host tools, docs, common `platform/orbis/` fixes):**
  - Keep shared changes in isolated commits without version-specific edits, then `git cherry-pick` them across active version branches.

## Basic Pull Request Flow

1. Fork the repository and create a feature branch from the target Godot version branch.
2. Make focused, minimal changes following Godot C++ / GDScript style conventions.
3. Run `make help` / relevant build checks locally before submitting.
4. Open a Pull Request describing what changed, why, and which branches need a cherry-pick.

By participating, you agree to follow our [Code of Conduct](CODE_OF_CONDUCT.md) and license your contributions under the [MIT License](LICENSE.md).
