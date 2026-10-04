cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.402"
  sha256 arm:   "e4e2273e4bc51507c2cf6ff2d31a24fb834681b950b424ff995bf18261a22483",
         intel: "d5b9cf6188b165487305f45862606e4fc7efa2906330bb5a92b8b34bbbc1a414"

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
