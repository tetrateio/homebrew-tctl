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

## For Maintainers

### Adding a New Formula Version

This tap is set up with automated formula generation based on Git tags. To add a new formula version:

1. Create and push a new tag following the format `v*` (e.g., `v1.12.4`)
   ```bash
   git tag v1.12.4
   git push origin v1.12.4
   ```

2. The GitHub Actions workflow will automatically:
   - Extract the version number from the tag
   - Download the appropriate binary files for both Intel and ARM architectures
   - Calculate SHA256 checksums
   - Update the main `tctl.rb` formula to the new version
   - Create a versioned formula in `Formula/Versions/tctl@<version>.rb`
   - Commit and push these changes back to the repository
   - Create a GitHub release with installation instructions

No manual formula editing is required! The system handles both the latest version and versioned formulas automatically.
