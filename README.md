# PLAY

Various scripts, experiments, and utilities.

## Contents

### setup-openclaw.sh

One-click setup script for [OpenClaw](https://openclaw.ai/) on WSL Ubuntu.

**Usage:**

```powershell
# From Windows - first install WSL if needed
wsl --install -d Ubuntu-22.04

# Then run the setup script
wsl -d Ubuntu-22.04 -- bash /mnt/c/SEIKA/PLAY/setup-openclaw.sh
```

The script automatically handles:
- nvm installation
- Node.js 22 setup
- npmrc prefix fixes
- OpenClaw installation

After running, execute `openclaw onboard --install-daemon` to configure your API key.
