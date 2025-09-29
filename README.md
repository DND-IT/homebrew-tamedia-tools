# Homebrew Tap

Official Homebrew tap for [tamedia-tools](https://github.com/dnd-it/tamedia-tools) - AWS service tunneling tools for Kubernetes.

## Installation

### Direct installation (recommended)
```bash
# Install the complete suite directly
brew install dnd-it/tap/tamedia-tools

# Or install individual tools
brew install dnd-it/tap/tamedia-tunnel
brew install dnd-it/tap/tamedia-aws-cli-helpers
```

### Via tap
```bash
# Add the tap first
brew tap dnd-it/tap

# Then install using short names
brew install tamedia-tools
brew install tamedia-tunnel
brew install tamedia-aws-cli-helpers
```

## Available Formulas

- **tamedia-tools** - Complete suite of AWS and Kubernetes productivity tools
- **tamedia-tunnel** - AWS service tunneling tool for Kubernetes

## Requirements

- macOS or Linux
- Homebrew
- AWS CLI
- kubectl
- jq

## Documentation

For usage instructions and documentation, see the main repository:
https://github.com/dnd-it/tamedia-tools

## Issues

Please report issues in the main repository:
https://github.com/dnd-it/tamedia-tools/issues
