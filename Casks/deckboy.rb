cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.393"
  sha256 arm:   "8b7134c89b4914e3db43a16393c52dcaf3c191638a625ef9faa3d20edcaa846c",
         intel: "fc918f7541298f40c78db3f932dcf16180dc627f4cfc6d0fcd3674ede2cd9157"

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
