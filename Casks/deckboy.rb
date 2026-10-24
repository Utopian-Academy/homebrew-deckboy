cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.419"
  sha256 arm:   "2fc03083b332271b2bf7d0f8f9fd9d601440cb0f7ff6eb1934e14dddb7ff342e",
         intel: "0db3d2b891f5c3ea5444d50bd2250996c41672b188ef90b784bafc1abff59c39"

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
