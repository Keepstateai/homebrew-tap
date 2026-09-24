# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-darwin-arm64"
      sha256 "57003145cdc5acb284bd099ebcc898c34816e217510ae323e052b1e87bb4ff0a"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-darwin-amd64"
      sha256 "fa245d6eeeb92815cc901217f0dce05b7b67178a999d56b7807453935c21e238"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-linux-arm64"
      sha256 "a3503ddd238ae74d19ac34fe446d09763745029cf5de0eb2f5f9af5d327eeb65"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.9/ks-linux-amd64"
      sha256 "c5ed432e8974f008d0db85015fc8d6bdfb7aa3eb079b8fcce3b3d254378bdf2c"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
