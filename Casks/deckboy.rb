cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.401"
  sha256 arm:   "765e8abedb7f24b7476af8ee1606fdb63ae7eb6c8f1b8437b63fe513f3042636",
         intel: "a85629d06312aacc5a567f21d4c18cc4e300920abf89dceb52dbe4e1761dbee9"

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
