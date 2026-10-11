cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.410"
  sha256 arm:   "a24b79660167658fa93daac28baf73ef748f0b936626a65c284ea8d26902e519",
         intel: "ba8beb7cabd6014843faf36d4d8d3928bdaffdbcdd79d77b1011c37888aa45a9"

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
