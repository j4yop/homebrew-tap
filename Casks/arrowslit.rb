cask "arrowslit" do
  version "0.4.7"
  sha256 "39e08fb92c8484f59f49040898eb9c12e373ccd21a1e4975270a5a22a7ffb1a7"

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

  # The app is not notarized yet; this skips the one-time Open Anyway step.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Arrowslit.app"],
        writable_paths: ["Arrowslit.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.j4yop.arrowslit"

  zap trash: [
    "~/Library/Application Support/Arrowslit",
    "~/Library/Caches/com.j4yop.arrowslit",
    "~/Library/Preferences/com.j4yop.arrowslit.plist",
    "~/Library/Saved Application State/com.j4yop.arrowslit.savedState",
  ]
end
