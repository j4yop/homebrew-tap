cask "arrowslit" do
  version "0.8.2"
  sha256 "6b0638d49babf2595a9e685b4db7d38ee7b814c85b6ddf62f2aae58d75d33e1a"

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
