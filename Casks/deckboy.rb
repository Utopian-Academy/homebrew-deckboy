cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.400"
  sha256 arm:   "ef30042f4e2ad06d8bfb98d4ac6f699b7b4f6303845edd5f26819254c822303d",
         intel: "9018df5540c800fab1452737f3b5ffa02c58c55acd1908b65371e43ba0beec0a"

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
