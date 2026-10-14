# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.24/ks-darwin-arm64"
      sha256 "ad3a9920c796bd8f7195f1971372e4e5990c663251c640d5050a346d4fb6061b"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.24/ks-darwin-amd64"
      sha256 "29951ae0773427430a4a6713a09e8e43694203bd69eecd81dac2bee9ae87191f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.24/ks-linux-arm64"
      sha256 "7ffd334266cfa4ff498d24c171189f04167201f57b3ad805992de161690e6372"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.24/ks-linux-amd64"
      sha256 "2c284778919fecd2a00e7f36fbf4598ef90a648d962a677366dd899cd80125e4"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
