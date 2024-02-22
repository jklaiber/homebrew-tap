# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Jumper < Formula
  desc "Jumper is a simple CLI SSH manager"
  homepage "https://github.com/jklaiber/jumper"
  version "0.1.2"
  license "GPL-3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.2/jumper_0.1.2_darwin_arm64.tar.gz"
      sha256 "93707f4b7ef9f90c29cd838a3b40d73fc51969f86556b2d934e3eda096e7ee81"

      def install
        bin.install "jumper"
        bash_completion.install "completions/jumper.bash" => "jumper"
        zsh_completion.install "completions/jumper.zsh" => "_jumper"
        fish_completion.install "completions/jumper.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.2/jumper_0.1.2_darwin_amd64.tar.gz"
      sha256 "1c06cba56fb5bec39864a3f537770f6dea8152175b1029e23715991bac396a9c"

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
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.2/jumper_0.1.2_linux_arm64.tar.gz"
      sha256 "f0ed6fb49709ad0d863c8660c77d764c9591154ed94753686cf267dfd584e2a1"

      def install
        bin.install "jumper"
        bash_completion.install "completions/jumper.bash" => "jumper"
        zsh_completion.install "completions/jumper.zsh" => "_jumper"
        fish_completion.install "completions/jumper.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jklaiber/jumper/releases/download/v0.1.2/jumper_0.1.2_linux_amd64.tar.gz"
      sha256 "91e38190c8cf8bc5d5684796603d2e46e09156a79ed5b5089a9230dda944a65c"

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
