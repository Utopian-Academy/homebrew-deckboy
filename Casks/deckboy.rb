cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.407"
  sha256 arm:   "472f1a719e77fa4d8705b41d9dad54603df068ce91e46ede2fce9a1f7ae8faff",
         intel: "025adbe77251f7afbb29f25c0744198d6ac61b5f9f7f55bec630185721d1087f"

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
