cask "arrowslit" do
  version "0.1.0"
  sha256 "468613a0e895345daf53105af96ab72c379e16fbafa35605deec5af77a20ef99"

  url "https://github.com/j4yop/arrowslit/releases/download/v#{version}/Arrowslit-#{version}.dmg"
  name "Arrowslit"
  desc "Local-only productivity nook for the Mac notch"
  homepage "https://github.com/j4yop/arrowslit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Arrowslit.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Arrowslit.app"]
  end

  uninstall quit: "com.j4yop.arrowslit"

  zap trash: [
    "~/Library/Application Support/Arrowslit",
    "~/Library/Caches/com.j4yop.arrowslit",
    "~/Library/Preferences/com.j4yop.arrowslit.plist",
    "~/Library/Saved Application State/com.j4yop.arrowslit.savedState",
  ]
end
