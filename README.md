# Homebrew tap for Deckboy

[Deckboy](https://utopian-academy.github.io/Deckboy/) is free, open-source cue-based media playback and show control for live video: theatre, live events, worship and broadcast.

```sh
brew install --cask utopian-academy/deckboy/deckboy
```

Apple Silicon and Intel are both covered. `brew upgrade --cask deckboy` moves to each new release; this tap follows Deckboy's releases automatically.

Deckboy is free software and is not code-signed. If macOS says the app is damaged when you first open it, run once:

```sh
xattr -dr com.apple.quarantine /Applications/Deckboy.app
```

Source, issues and the manual: https://github.com/Utopian-Academy/Deckboy
