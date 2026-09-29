# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.17/ks-darwin-arm64"
      sha256 "7f4ce39c170b9aab63fb0c9ec662c7e4827786004e88ca131cedd24f71a80d14"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.17/ks-darwin-amd64"
      sha256 "9192eaea056ef9cae14e989539385a912173507171e9098c909f072b71cab95b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.17/ks-linux-arm64"
      sha256 "bf8701ff477f1cc787de53cb5f2c132a5792349fbbb368d12168102e4b014141"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.17/ks-linux-amd64"
      sha256 "60aea80b165ac6a9e685cb44f31f1f5b3b77dfb2594311f803d3f9dcdb91bb4f"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
