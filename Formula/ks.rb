# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.38/ks-darwin-arm64"
      sha256 "1a47a4bb124d31213d7786b1e6c730f240d20e757b7a8fb6bc460064cf6e8c01"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.38/ks-darwin-amd64"
      sha256 "a9e916f0c6d5df3f37b8d0030274afa8f87d8808b4087afd7fe7f483376da090"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.38/ks-linux-arm64"
      sha256 "0a4b1db1d712d6f763e0cb5143ba7d611661f174d60ab41551ceae36fc1da8e1"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.38/ks-linux-amd64"
      sha256 "7a9812ae0b49ba143f3f124edb21ee4c3ac7f93e794d60dc5d6089d525f6c658"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
