cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.374"
  sha256 arm:   "310ca8c863031c4f1531f8d6e72c259ac449b6a690f0aef64e5884dbf27da853",
         intel: "694ea366808635f714fa36e57d048cf356be2bcb6a46920dabda80320dbb2098"

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
