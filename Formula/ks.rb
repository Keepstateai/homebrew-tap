# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.45/ks-darwin-arm64"
      sha256 "e23c1dae5c3b397f01ab0f9a01b36311814e1a1c992af58778bd6c5ad8966a23"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.45/ks-darwin-amd64"
      sha256 "d41b21131735a5571b86204e9e3f3a6d0a03f3de3f801f4b9d415cc84b8a7c34"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.45/ks-linux-arm64"
      sha256 "be8222ca7839db043927e8d8fc3de256f7809d30d81ead5549d8fbdc6f3cccef"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.45/ks-linux-amd64"
      sha256 "5770dfe642f7677e82066bc1f66b04070ff1e5541023759ce443f24f69aaf68e"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
