# Homebrew Tap for Tetrate Service Bridge CLI (tctl)

This repository contains the Homebrew formula for installing the Tetrate Service Bridge CLI tool (`tctl`).

## Usage

```bash
# Add this tap to your Homebrew
brew tap tetrateio/tctl

# Install tctl (explicitly use our tap to override default formula)
brew install tetrateio/tctl/tctl
```

## Important Note for Existing Users

If you previously installed `tctl` manually (not through Homebrew), please remove it from your path before installing via Homebrew to avoid conflicts:

```bash
# Check where your current tctl is installed
which tctl

# If it's not pointing to a Homebrew location (/usr/local/bin or /opt/homebrew/bin),
# remove or rename the existing binary before installing via Homebrew
```

## Documentation

For more information about using `tctl`, please refer to the [official documentation](https://docs.tetrate.io/service-bridge/reference/cli/guide/).
