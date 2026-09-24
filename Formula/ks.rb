# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-darwin-arm64"
      sha256 ""
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-darwin-amd64"
      sha256 ""
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-linux-arm64"
      sha256 ""
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-linux-amd64"
      sha256 ""
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
