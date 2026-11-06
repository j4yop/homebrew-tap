cask "dragconvert" do
  version "0.5.0"
  sha256 "6d182942b5004fb6ed863c8ac2a07d869e65f68415ac5da4c3fd7a6c8bc1d094"

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
