cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.419"
  sha256 arm:   "d7e9588b2421057aad7a48fce6466d0f7278a7eebed52efbf6441456a499665c",
         intel: "be1b659a525a6ff3ffd27824cbc1458a727650c158dfbb2cd8ea1205af336170"

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
