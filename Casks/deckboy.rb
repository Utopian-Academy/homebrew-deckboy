cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.379"
  sha256 arm:   "ab5c88e48293c48e2434825e6655f56dd8f320aba1f685b8f8adff15d13eff0e",
         intel: "9226f042906d2a289efcab77468cd4bd4492ee872a5ff0fc88f811e3e15c48ff"

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
