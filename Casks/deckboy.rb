cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.397"
  sha256 arm:   "3a0165d6ecf9aca00a36f0e9c41a5580bf7263a5d61ed64fbdb3d21dd8db679e",
         intel: "af693d70d017805c372117afb0bf800688e8f3b0b9235e1ccc91d2fb4d962ff7"

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
