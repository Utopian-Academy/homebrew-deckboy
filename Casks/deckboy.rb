cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.405"
  sha256 arm:   "f9999133f8ea68227f26b52411d28a68a425f50dd89146971807c31e85a15f34",
         intel: "8ed5186b7497dfccb0eddf5022f506e84227bbf66dc3de6eaddc0c561e0226cf"

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
