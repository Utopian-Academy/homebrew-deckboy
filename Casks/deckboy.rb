cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.398"
  sha256 arm:   "88f8347668da9b44b7f3432a91fd59d189765ba1b51e77bbe47d7e8dd5237cdd",
         intel: "df4a84cf9c974ce350d8b5b18962df12d844772fe5d4ccbbd695d64008353701"

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
