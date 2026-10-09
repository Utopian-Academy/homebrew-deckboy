cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.408"
  sha256 arm:   "1ff536e400830a78e09c05fcc91247613745092fa86217bf55e66812e0868f56",
         intel: "a50a264165df793c53fbf08c8d235198283d1a049f7ea54e2c06a628df11fa58"

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
