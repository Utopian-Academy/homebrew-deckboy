cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.420"
  sha256 arm:   "a044d1f6c7ec5d64afa9891e0f99f40c10f53f8798d1077ae1787bbfba6ecfb5",
         intel: "b148751588e08056ae71eb930144a7c1118040972827d8d914b0ab39dfcb64eb"

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
