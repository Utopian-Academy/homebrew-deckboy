cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.415"
  sha256 arm:   "21c9344a64a5e88dc20b22ac700461173c4dc59e868364317435d32bed71680c",
         intel: "14b070504773d14882aa527538480136400ba5dc448712ea4ec37269cfeb8d28"

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
