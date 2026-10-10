cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.409"
  sha256 arm:   "7fc46ad369cfe10a3e63f6b5a8eaf9b03dd97fdc034ec4f5be205c3c88cb63c1",
         intel: "673921700947fcde1004a32c5e02340d811b80beafd240c546fbc256f6357fdf"

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
