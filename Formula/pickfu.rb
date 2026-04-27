# typed: false
# frozen_string_literal: true

class Pickfu < Formula
  desc "PickFu CLI — consumer feedback from your terminal"
  homepage "https://github.com/pickfu/pickfu-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.7.0/pickfu-v0.7.0-darwin-arm64.tar.gz"
      sha256 "bd27a254155abcc12bf9abc9158c6cdc7b8f84e3939f1ff1112ad53f3939f63e"
    else
      url "https://dl.agents.pickfu.com/releases/v0.7.0/pickfu-v0.7.0-darwin-x64.tar.gz"
      sha256 "923a0721920a41d7b24f9cdda79c40c3eed0d3e1f73dc03c7bc32e820139f049"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.7.0/pickfu-v0.7.0-linux-arm64.tar.gz"
      sha256 "3ce1895253ab266f4b093df3f4095204c18df06b9fb9faca3f06e5c28233f03d"
    else
      url "https://dl.agents.pickfu.com/releases/v0.7.0/pickfu-v0.7.0-linux-x64.tar.gz"
      sha256 "7f36ecbebe43af02e96dd1d48771026b031764714395f51e11b7ce6e69bca563"
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
