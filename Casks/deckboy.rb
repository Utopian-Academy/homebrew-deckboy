cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.424"
  sha256 arm:   "40ef8394159f839cd3a676cfe124114384aadf266115d28d65781ac702298237",
         intel: "24d9d090c4fd743e38e68ec7b84e50a7403127b5886301d41a85ecae0b1f8b25"

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
