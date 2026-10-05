cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.403"
  sha256 arm:   "71e72e8af468ac16c4dadc27b3dd3d224d7767dd36e8e4c6b482beeef0ce310a",
         intel: "6b1aef063dc6c70128d749b6bd08aef7ecf5e5a1e6c876de8c50429273bee597"

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
