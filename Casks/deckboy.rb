cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.404"
  sha256 arm:   "8171e856f8346bb243b84a443d6a9fc156e171542bde55902bafc143e65fce0f",
         intel: "b6c1891e46b6ed5504bc9e49976960cfdadef7524f371776932ec413ea9f6528"

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
