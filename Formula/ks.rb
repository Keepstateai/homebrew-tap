# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.36/ks-darwin-arm64"
      sha256 "28b2e6703278d4531321aadda1b2366ef33f8df6552123995fcd16f4934ac5d6"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.36/ks-darwin-amd64"
      sha256 "e3fa0aabe1faa8089308bfcca9388974b1d0c69007333141748344cbe876f1f8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.36/ks-linux-arm64"
      sha256 "4fd070c3268db11fe4d9feb2bd889d2858c2dcd2ba7a3b0dec78ba9e7c75a607"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.36/ks-linux-amd64"
      sha256 "c63eda74fe726c4d54e0a4a14029b9f84bd700181205e1a203c610f9a25a9b8d"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
