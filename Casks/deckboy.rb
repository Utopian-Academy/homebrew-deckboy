cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.399"
  sha256 arm:   "522c33e83813587211ccc7f313662421f104f40486ae006ab10200b4064935bd",
         intel: "378e0f262111340d34901fbe2c744f92b674ee3b159d8f3fc323cd23670182a2"

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
