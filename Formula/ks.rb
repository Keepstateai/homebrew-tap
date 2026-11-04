# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.37/ks-darwin-arm64"
      sha256 "39c569f36e2aca101cdba90a762b71a1bd8721d098c8ef77648a897c62237c26"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.37/ks-darwin-amd64"
      sha256 "8f69841cadf9e065f48fa88c9e5a5a9fa39b1a09cecd86f3b2c3190a93c24e1d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.37/ks-linux-arm64"
      sha256 "9a7e9f2be28bd677959070caa23552c0e2d195d6668c56598417341c83df58ed"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.37/ks-linux-amd64"
      sha256 "54269ebe0531d6bf4e2a3e9ffaf9893b9d8813aeae6c46b0a4a437c1e9a40363"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
