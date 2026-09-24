cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.376"
  sha256 arm:   "fa5ffdfc0f250fca576b354b61176e8631a5b3a9d1af208facb46816402324a8",
         intel: "4bfda4d917c8d9dfde221e45506e93ab787fbc3dfda99b07ac719eb2b73110b0"

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
