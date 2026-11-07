cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.425"
  sha256 arm:   "661028e9c8415e61d7fc9c1711f5e522b6db6514d4b4f00d245fc4e77fea6ec3",
         intel: "4a5f6c3916900a13b82a118243faacb86403a5707a677d8f2385f0aded6e6c63"

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
