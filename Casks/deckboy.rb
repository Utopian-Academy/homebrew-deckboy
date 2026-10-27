cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.421"
  sha256 arm:   "965ce3eae0316212215d7f4f7cf2d84777e609f0daa26a004c7a9167cb4f2deb",
         intel: "c7398cb70916b5fea7d954d31ed3ab72a2a6f2c17d780b279b84c94063715231"

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
