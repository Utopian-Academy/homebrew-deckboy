cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.423"
  sha256 arm:   "c3c74f5e72aea08b6b07bfb37375b5b140414b82a97dff9b50fe6a837c242f68",
         intel: "99875ec36bac09ba8310614f6238890ab10c9856dc36c2162458550f213b2058"

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
