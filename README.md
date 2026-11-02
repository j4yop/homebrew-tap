# j4yop Homebrew tap

Homebrew 7 requires trusting this third-party tap once.

## DragConvert

```bash
brew trust j4yop/tap && brew install --cask j4yop/tap/dragconvert
```

DragConvert is a free, GPL-3.0-only, native macOS file wheel: drag a file,
tap ⇧ / ⇧⌥ / ⌃, and drop on a wedge. It converts and edits files locally,
beside the original.

Source, releases and the full GPL text:
https://github.com/j4yop/DragConvert

The build is ad-hoc signed and not notarized; the cask clears the quarantine
flag automatically. If macOS still blocks it, use
System Settings → Privacy & Security → Open Anyway once.

## Arrowslit

```bash
brew trust j4yop/tap && brew install --cask j4yop/tap/arrowslit
```

Arrowslit is a local-only productivity nook for the MacBook notch.
Source and releases: https://github.com/j4yop/arrowslit
