cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.396"
  sha256 arm:   "b7e0b9f9cc3129379e9d6e35e8d1a20b3e419faa5490b320d5ba17b1e84e6fc7",
         intel: "dc427e4f19c1aafc0896e7f7f9b00324555fae62c6136644dc9909a98898d6d6"

  url "https://github.com/Utopian-Academy/Deckboy/releases/download/v#{version}/Deckboy-#{version}-macos-#{arch}.dmg"
  name "Deckboy"
  desc "Free, open-source cue-based media playback and show control for live video"
  homepage "https://utopian-academy.github.io/Deckboy/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Deckboy.app"

  caveats <<~EOS
    Deckboy is free software and is not code-signed. If macOS says the app is
    damaged when you first open it, run this once:
      xattr -dr com.apple.quarantine "#{appdir}/Deckboy.app"
  EOS
end
