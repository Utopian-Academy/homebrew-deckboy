cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.413"
  sha256 arm:   "8f61cc31d2759e33f9d96b80c955918a7c50bbdfe91d14c49d68b2cb550ded45",
         intel: "b3f9f8871bedc51fca84a80f4a766224f0364e8ebb258ec12e719566c84105fd"

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
