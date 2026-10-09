# typed: false
# frozen_string_literal: true

class Pickfu < Formula
  desc "PickFu CLI — consumer feedback from your terminal"
  homepage "https://github.com/pickfu/pickfu-monorepo/tree/main/pickfu-cli"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.9.0/pickfu-v0.9.0-darwin-arm64.tar.gz"
      sha256 "2f3aff74af83345d2bc4db586f32e7dddc7c429b24693805e96728290dc1bcc2"
    else
      url "https://dl.agents.pickfu.com/releases/v0.9.0/pickfu-v0.9.0-darwin-x64.tar.gz"
      sha256 "7385294c59491fd801c8fb1d0cf9ff44a4ae7a0cba8658fa4323b75b46d195ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.agents.pickfu.com/releases/v0.9.0/pickfu-v0.9.0-linux-arm64.tar.gz"
      sha256 "501b6e60026fdcdf8cff6e25efa0e07977f1dfeb80e23b4e81d7716cf62620b2"
    else
      url "https://dl.agents.pickfu.com/releases/v0.9.0/pickfu-v0.9.0-linux-x64.tar.gz"
      sha256 "225a629eb00297ebdc6c7d2dd9bfc12260c9743f409c946ac00f3800428e9f76"
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
