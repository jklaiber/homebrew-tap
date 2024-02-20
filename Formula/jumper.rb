# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Jumper < Formula
  desc "Jumper is a simple CLI SSH manager"
  homepage "https://github.com/jklaiber/jumper"
  version "0.1.0"
  license "GPL-3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.0/jumper_0.1.0_darwin_arm64.tar.gz"
      sha256 "113981157f90c224a0bee408826bd8dd066115b186c81a006caa1b674661ce81"

      def install
        bin.install "jumper"
        bash_completion.install "completions/jumper.bash" => "jumper"
        zsh_completion.install "completions/jumper.zsh" => "_jumper"
        fish_completion.install "completions/jumper.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.0/jumper_0.1.0_darwin_amd64.tar.gz"
      sha256 "bfb8105d27bd978e68b1317a6300c510cdc54d667933de96b5e6345521bd9253"

      def install
        bin.install "jumper"
        bash_completion.install "completions/jumper.bash" => "jumper"
        zsh_completion.install "completions/jumper.zsh" => "_jumper"
        fish_completion.install "completions/jumper.fish"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.0/jumper_0.1.0_linux_arm64.tar.gz"
      sha256 "1675412e6008daed28911a10497c9855746d417edce3fafd4733f74b2bcba2ce"

      def install
        bin.install "jumper"
        bash_completion.install "completions/jumper.bash" => "jumper"
        zsh_completion.install "completions/jumper.zsh" => "_jumper"
        fish_completion.install "completions/jumper.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.0/jumper_0.1.0_linux_amd64.tar.gz"
      sha256 "43082c7491168564c200582c0976c9d1a3f47220a258d5823d4b81e6c1b58d10"

      def install
        bin.install "jumper"
        bash_completion.install "completions/jumper.bash" => "jumper"
        zsh_completion.install "completions/jumper.zsh" => "_jumper"
        fish_completion.install "completions/jumper.fish"
      end
    end
  end

  test do
    system "#{bin}/jumper version"
  end
end
