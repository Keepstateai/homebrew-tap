# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.6/ks-darwin-arm64"
      sha256 "d19f6e62e5f9b6c95998567a8948dd81e43aeb42f6843f2e28b4a6f0fcb12ec4"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.6/ks-darwin-amd64"
      sha256 "cc9073e5857307438b500e21fde4fed97c2522d8690a4d20af8e6629565002ea"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.6/ks-linux-arm64"
      sha256 "96099d7b57d874dbd427ef61a05ebb7f48bd0df8cd04a162ff03f9871892aff1"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.6/ks-linux-amd64"
      sha256 "6e08dd195ccef162ac5a43455436921592048177a5622c6f4e7d56ab0382c338"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
