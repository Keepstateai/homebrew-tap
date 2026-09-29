# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.15/ks-darwin-arm64"
      sha256 "0b2066639c2fe6a25416be25244bfd1906a09e91b051296b8195cbb42a24774d"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.15/ks-darwin-amd64"
      sha256 "67d873b874f571eaf5f76d9f6f376e439b2e33e58f6204e21550c19304ba4be3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.15/ks-linux-arm64"
      sha256 "10be317c08e4c200b08413be0c9183470992887713d2b5510b4e98d3c438fc1a"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.15/ks-linux-amd64"
      sha256 "e84a62ef422265255d8ca1eb9a11485c43a56f54f1ef2d681b51eb0a91b0285f"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
