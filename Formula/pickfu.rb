# typed: false
# frozen_string_literal: true

class Pickfu < Formula
  desc "PickFu CLI — consumer feedback from your terminal"
  homepage "https://github.com/pickfu/pickfu-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.6.0/pickfu-v0.6.0-darwin-arm64.tar.gz"
      sha256 "b852236b0e824aee5447a3497bfb888b9164898d7b4470e7522e8fc67444183e"
    else
      url "https://dl.agents.pickfu.com/releases/v0.6.0/pickfu-v0.6.0-darwin-x64.tar.gz"
      sha256 "db0f243aa136ceef1ff673994cc293d6c0b41839e7afe6fd6f7a082ccdbe69a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.6.0/pickfu-v0.6.0-linux-arm64.tar.gz"
      sha256 "a71dc57de194bd6d7c2292642ccad28e5074231fd6f2a46cf316c90617416cdb"
    else
      url "https://dl.agents.pickfu.com/releases/v0.6.0/pickfu-v0.6.0-linux-x64.tar.gz"
      sha256 "4c4425bbcc9079a79727aa2b89e9e38a40922282983bb29ef6b48256ac270cc4"
    end
  end

  def install
    libexec.install Dir["pickfu/*"]
    bin.install_symlink libexec/"bin/pickfu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pickfu --version")
  end
end
