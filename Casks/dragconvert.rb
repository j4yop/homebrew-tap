cask "dragconvert" do
  version "0.7.0"
  sha256 "369ac1dfb43de38ba85c5c99d072400b8ee09580dceddd6297e417b057a93ddf"

  url "https://github.com/j4yop/DragConvert/releases/download/v#{version}/DragConvert-#{version}.zip"
  name "DragConvert"
  desc "Free, open-source radial file converter for macOS"
  homepage "https://github.com/j4yop/DragConvert"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "DragConvert.app"

  # The app is not notarized yet; this skips the one-time Open Anyway step.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/DragConvert.app"],
        writable_paths: ["DragConvert.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.dragconvert.app"

  zap trash: [
    "~/Library/Containers/com.dragconvert.app",
    "~/Library/Caches/com.dragconvert.app",
    "~/Library/Preferences/com.dragconvert.app.plist",
    "~/Library/Saved Application State/com.dragconvert.app.savedState",
  ]

  caveats <<~EOS
    DragConvert is ad-hoc signed, not notarized. The cask clears the quarantine
    flag so it opens normally. If macOS still blocks it, use
    System Settings → Privacy & Security → Open Anyway once.
  EOS
end
