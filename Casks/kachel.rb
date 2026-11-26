# This file is written by scripts/update-cask.sh in jklaiber/kachel. Don't edit.
cask "kachel" do
  version "0.1.23"
  sha256 "552b8be8c6da867b4ca048b55d3f350908ff79eb6fbba5adccc18e6ec5ab24d4"

  url "https://github.com/jklaiber/kachel/releases/download/v#{version}/Kachel-#{version}.zip"
  name "Kachel"
  desc "Tiling window manager with xmonad's workspace model"
  homepage "https://github.com/jklaiber/kachel"

  depends_on macos: :tahoe

  app "Kachel.app"
  # The  command: the app's own executable, which acts as the
  # command line tool when started under this name.
  binary "#{appdir}/Kachel.app/Contents/MacOS/Kachel", target: "kachel"

  # Kachel is signed with its own certificate but not notarized (no paid
  # Apple Developer ID); without this macOS refuses to open the downloaded app.
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
    → Accessibility. Upgrades keep it.

    Quit Amethyst, yabai or AeroSpace first, and use one Space per display.
    Config: ~/.config/kachel/config.yaml (written on first launch).
  EOS
end
