# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.26/ks-darwin-arm64"
      sha256 "4e18fd3a741ff19a8278dd3d5b763191f177a2435b17a70c9680b62452015a33"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.26/ks-darwin-amd64"
      sha256 "e0193b9f14fc6768ed5f0e2cd9bd714b26a504a0a79f9bf45aee1c159845f2ed"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.26/ks-linux-arm64"
      sha256 "d0e20ba31c53695355a9a35ccb3241b9bc9b419f14c6ee9cffedc4b39f4a246c"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.26/ks-linux-amd64"
      sha256 "8575f838c1ebecba3cb331b9c47a312c2545fde4e07f791d73cb6b3a170662ce"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
