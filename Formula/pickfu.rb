# typed: false
# frozen_string_literal: true

class Pickfu < Formula
  desc "PickFu CLI — consumer feedback from your terminal"
  homepage "https://github.com/pickfu/pickfu-monorepo/tree/main/pickfu-cli"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.8.2/pickfu-v0.8.2-darwin-arm64.tar.gz"
      sha256 "fa3a0b2d8706405cb194e77bddafc27ae2372e8f2180700745e8444ccdeb1316"
    else
      url "https://dl.agents.pickfu.com/releases/v0.8.2/pickfu-v0.8.2-darwin-x64.tar.gz"
      sha256 "301198ad5ccaf23534e53bdc4f837d4cc296107cc9c73c4eb5ed03e4e4d058e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.8.2/pickfu-v0.8.2-linux-arm64.tar.gz"
      sha256 "fd8332db13ec17420dee58d96c2a21a85a6ea32d1e6792802a1abf2a7e1cb940"
    else
      url "https://dl.agents.pickfu.com/releases/v0.8.2/pickfu-v0.8.2-linux-x64.tar.gz"
      sha256 "4f93efc14c39da78b559f693e5a3212fcc1e9202e77badd4b4bf18cbc9808607"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/pickfu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pickfu --version")
  end
end
