# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.29/ks-darwin-arm64"
      sha256 "d053d5e7a5224497e96b20f64de467c7385c9ff948825099383d68cf9b6145e2"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.29/ks-darwin-amd64"
      sha256 "2ce0792887abdaef4a48c6e40d634818d0b9fdced361826f275bdc0cbe3daf2d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.29/ks-linux-arm64"
      sha256 "acbb5c9caeee9ee3478a200a139da95ab0f366f35d8b52381f5c794e3db16bab"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.29/ks-linux-amd64"
      sha256 "0d0ef28d39b64dbf36db1ae2a610d24d2176c07a98eb6f08b2fe358f9a26fb6e"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
