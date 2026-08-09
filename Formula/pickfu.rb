# typed: false
# frozen_string_literal: true

class Pickfu < Formula
  desc "PickFu CLI — consumer feedback from your terminal"
  homepage "https://github.com/pickfu/pickfu-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.8.0/pickfu-v0.8.0-darwin-arm64.tar.gz"
      sha256 "13b4d261301a039e2682b18fcc9f670268967cfdccc68447020ab3d30f8a4fea"
    else
      url "https://dl.agents.pickfu.com/releases/v0.8.0/pickfu-v0.8.0-darwin-x64.tar.gz"
      sha256 "e834e02f4f3a039207049f14359824a1e6dd933f705a8d175ea6e182bbb9614a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.8.0/pickfu-v0.8.0-linux-arm64.tar.gz"
      sha256 "5b7cdf9884d26b3510adad4ee0774eba95627e991bbfe33c732120a09f3c1127"
    else
      url "https://dl.agents.pickfu.com/releases/v0.8.0/pickfu-v0.8.0-linux-x64.tar.gz"
      sha256 "6931dcb90b207259fd1159df95d0b9ef3f7de45191a0f93e1a7793b86772f8fe"
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
