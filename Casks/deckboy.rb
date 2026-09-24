cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.377"
  sha256 arm:   "5e78b98fb10e737ae7f18a37f46315beaf5adc10ccaca4175fb481f293e00fd9",
         intel: "3e32d2bba16ea764701e565db62f499573cf126c960d23aef867282e7c2a66bb"

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
