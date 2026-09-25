cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.378"
  sha256 arm:   "4d881e04d882341ca37b9e3231ffff0170e77d9132f3687c255469201ad50b54",
         intel: "2f65c60a7341cbc1f9d86d97ccbc16c863e114a6b8ec509195d4be756e70d070"

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
