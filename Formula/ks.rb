# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.48/ks-darwin-arm64"
      sha256 "c9fd355d723b41daa43b5d97b34e5d1b2635d41b76dc958c2db23f6762249afa"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.48/ks-darwin-amd64"
      sha256 "4d577195c7a1f116fee3804336e3a16fbb1d1fac8a035a7e955a30b62acce5f1"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.48/ks-linux-arm64"
      sha256 "c83038b7cebb279b339f7a9d38195e9ee1177bed91b52d57d2b6b0e4a043312b"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.48/ks-linux-amd64"
      sha256 "c735f8485449f5e0832cff936d1bdc23b42e82aa0cbec5b7694de2163759eaf0"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
