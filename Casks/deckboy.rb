cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.412"
  sha256 arm:   "282d51532bff72d95af9ee2902e4f640efebe38d0ccf783925b8ea14f3d530e3",
         intel: "c7f0dddc3fac896f5a4e30ed04bcacb1418b2739f02b5bf20c5a86ff5deccd11"

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
