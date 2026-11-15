# This file is written by scripts/update-cask.sh in jklaiber/kachel. Don't edit.
cask "kachel" do
  version "0.1.5"
  sha256 "732114d071c8342507cd35e2b45db36d1848ef19ea8fe1ccbd4ff75196308f3c"

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
