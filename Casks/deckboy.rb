cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.417"
  sha256 arm:   "de2ce481f603f63bf954392cced84513c10740f3bbd4313dcb4cc577a3780734",
         intel: "6f3614333b23957351c6e124af0f50af38b3c99b6195ca777f79ec7a7770ad3f"

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
