#!/bin/bash
###############################################################################
# OpenClaw Setup Script for WSL Ubuntu
# 
# Usage (from Windows PowerShell):
#   wsl -d Ubuntu-22.04 -- bash /mnt/c/path/to/setup-openclaw.sh
#
# Or copy to WSL home and run:
#   bash ~/setup-openclaw.sh
###############################################################################

set -e

echo "=========================================="
echo " OpenClaw Setup Script"
echo "=========================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

success() { echo -e "${GREEN}✓${NC} $1"; }
warn() { echo -e "${YELLOW}⚠${NC} $1"; }
error() { echo -e "${RED}✗${NC} $1"; exit 1; }

# Step 1: Check/Install nvm
echo "Step 1: Checking nvm..."
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    success "nvm is already installed ($(nvm --version))"
else
    warn "nvm not found, installing..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    . "$NVM_DIR/nvm.sh"
    success "nvm installed"
fi
echo ""

# Step 2: Fix npmrc prefix issue (common problem!)
echo "Step 2: Fixing npmrc configuration..."
if [ -f "$HOME/.npmrc" ]; then
    # Remove prefix and globalconfig lines that conflict with nvm
    sed -i '/^prefix=/d' "$HOME/.npmrc" 2>/dev/null || true
    sed -i '/^globalconfig=/d' "$HOME/.npmrc" 2>/dev/null || true
    success "npmrc cleaned"
else
    success "No npmrc issues"
fi
echo ""

# Step 3: Install Node.js 22
echo "Step 3: Installing Node.js 22..."
if nvm ls 22 &>/dev/null; then
    success "Node.js 22 already installed"
else
    nvm install 22
    success "Node.js 22 installed"
fi
nvm use 22
nvm alias default 22
success "Node.js $(node --version) is now default"
echo ""

# Step 4: Install OpenClaw
echo "Step 4: Installing OpenClaw..."
if command -v openclaw &>/dev/null; then
    CURRENT_VERSION=$(openclaw --version 2>/dev/null || echo "unknown")
    warn "OpenClaw already installed (v${CURRENT_VERSION}), upgrading..."
fi
npm install -g openclaw@latest
success "OpenClaw $(openclaw --version) installed"
echo ""

# Step 5: Verify installation
echo "=========================================="
echo " Installation Complete!"
echo "=========================================="
echo ""
echo "  Node.js: $(node --version)"
echo "  npm:     $(npm --version)"
echo "  OpenClaw: $(openclaw --version)"
echo ""
echo "Next steps:"
echo "  1. Run: openclaw onboard --install-daemon"
echo "  2. Follow the wizard to set up your API key"
echo ""
echo "Enjoy! 🎉"
