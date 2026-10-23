cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.418"
  sha256 arm:   "be13d54cddd8b80fab27c464cf5179e39417eae52846782f3c95030a0b9f3218",
         intel: "c2651d28a30ac0e9fc0474d094a761485b15c700a912fe8218f1863ec483f47d"

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
