# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.31/ks-darwin-arm64"
      sha256 "8d8940f1afc1a12f1229f5b56f7a591adf900c0987124a47f2223b5ea0a5932a"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.31/ks-darwin-amd64"
      sha256 "0c7d0e218d0a38061224d922f27f1cb59acbecb2e36fdf7ede6f7c4bcd420283"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.31/ks-linux-arm64"
      sha256 "7c8fe4eac265c8eacb414ae4d7bbec7200fa251b3d1b26e06bafb8203e7a0d4c"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.31/ks-linux-amd64"
      sha256 "e96f329a59335c55feddaa98bc1f27717b5a1329a67890b18a6233f0128bd39e"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
