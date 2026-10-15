# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.25/ks-darwin-arm64"
      sha256 "a4bd350a42863a1990d8176f87ecf571f7567f47e207c786972d702626015aa1"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.25/ks-darwin-amd64"
      sha256 "5c338dd865a62669cf535daf8d7a114f87dfb9a65264542cfe9b84ce92a05b4e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.25/ks-linux-arm64"
      sha256 "1b1675f4c66a7da66e203ceba0152bc78d495fa7d25db625601b16050c40c036"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.25/ks-linux-amd64"
      sha256 "fbcf8be10ed63ce63793dc1f193cf453a61399f8fe8828b7c45b2c05d0629518"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
