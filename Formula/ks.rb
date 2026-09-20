# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.8/ks-darwin-arm64"
      sha256 "c9ff6d5df6e4a1e8f8914037221b8c103346a93aa958e357d756cc5eb06033ff"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.8/ks-darwin-amd64"
      sha256 "adbf37368076bfab065312f4c9bc51e35682b555c03941309b0d24d8d40957e5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.8/ks-linux-arm64"
      sha256 "33749a4e24c00f8c40c72cc0f6977882079f8f0b6a4714dc7da0425955eae1d8"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.8/ks-linux-amd64"
      sha256 "a32586b5997dccf89b64732694a9ad1191bcf161df93cb52405eaaba74f7b867"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
