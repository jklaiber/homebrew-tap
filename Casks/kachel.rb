# This file is written by scripts/update-cask.sh in jklaiber/kachel. Don't edit.
cask "kachel" do
  version "0.1.15"
  sha256 "ed93f088be008894949c6c9bfc1efd7492a05ed680ce5c0c848a9fef6cc71765"

  url "https://github.com/jklaiber/kachel/releases/download/v#{version}/Kachel-#{version}.zip"
  name "Kachel"
  desc "Tiling window manager with xmonad's workspace model"
  homepage "https://github.com/jklaiber/kachel"

  depends_on macos: :ventura

  app "Kachel.app"

  # Kachel isn't notarized (no paid Apple Developer ID); without this macOS
  # refuses to open the downloaded app.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Kachel.app"],
        must_succeed:   false,
        writable_paths: ["{{appdir}}/Kachel.app"]
  end

  uninstall quit: "io.github.jklaiber.kachel"

  zap trash: [
    "~/.config/kachel",
    "~/Library/Application Support/Kachel",
    "~/Library/Logs/Kachel.log",
  ]

  caveats <<~EOS
    Kachel needs Accessibility permission: System Settings → Privacy & Security
    → Accessibility. After every upgrade macOS asks again (the app is ad-hoc signed).

    Quit Amethyst, yabai or AeroSpace first, and use one Space per display.
    Config: ~/.config/kachel/config.yaml (written on first launch).
  EOS
end
