# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.27/ks-darwin-arm64"
      sha256 "48a35dee041f88be72d52a48fd28508e8babd26db167bf27ff62edb8266103a6"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.27/ks-darwin-amd64"
      sha256 "c4a8e5f33fea5b5b17b634ba4774c89e856639390f6c4ae1d00af76f1407c2dc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.27/ks-linux-arm64"
      sha256 "4ca38ef0e2fee0891353e0e80733ab72f663387701f7c511beea054f67ac5834"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.27/ks-linux-amd64"
      sha256 "e396ed81c7d89a2d17c9b5f212782da140588d6422c70d6c22e9e55c1f6cff0e"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
