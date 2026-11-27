# godot-ps4-homebrew — Basic Makefile

DOCKER_IMAGE   ?= godot-ps4-toolchain:latest
GODOT_VERSION  ?= 3.6
BUILD_DIR      ?= build
DIST_DIR       ?= dist

PS4_IP         ?= 192.168.1.100
BINLOADER_PORT ?= 9090
KLOG_PORT      ?= 3232

.DEFAULT_GOAL := help
.PHONY: help toolchain poc templates host-tools deploy-elf klog clean

help: ## Show available targets
	@echo "godot-ps4-homebrew (Godot $(GODOT_VERSION))"
	@echo ""
	@echo "Usage: make <target> [PS4_IP=x.x.x.x]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

toolchain: ## Build Docker cross-compilation image (OpenOrbis + PacBrew)
	@echo "[TODO] Build Docker image $(DOCKER_IMAGE) from docker/Dockerfile.toolchain"

poc: ## Build standalone OpenOrbis + Piglet + Pad + Audio PoC (.pkg)
	@echo "[TODO] Build standalone Orbis PoC into $(BUILD_DIR)/poc/"

templates: ## Cross-compile Godot Orbis debug/release export templates (.tpz)
	@echo "[TODO] Build Godot $(GODOT_VERSION) Orbis templates into $(DIST_DIR)/"

host-tools: ## Fetch/build host packaging tools (create-fself, PkgTool.Core)
	@echo "[TODO] Prepare host tools for macOS/Linux/Windows"

deploy-elf: ## Send test payload to GoldHEN BinLoader
	@echo "[TODO] Deploy ELF/FSELF to $(PS4_IP):$(BINLOADER_PORT)"

klog: ## Stream PS4 kernel/debug logs from GoldHEN klog
	nc $(PS4_IP) $(KLOG_PORT)

clean: ## Remove build and distribution artifacts
	rm -rf "$(BUILD_DIR)" "$(DIST_DIR)"
