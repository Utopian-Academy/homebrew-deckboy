cask "deckboy" do
  arch arm: "arm64", intel: "x86_64"

  version "0.99.411"
  sha256 arm:   "07211d18bf999d0bdb94c9958133bf6ba445de81c77aa1357f591fa5fb617326",
         intel: "e7ef2307ae41fd3625ccc76fff42215334ebcce510d74941e1d3d15b39df9535"

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
