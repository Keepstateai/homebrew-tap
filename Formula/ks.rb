# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.18/ks-darwin-arm64"
      sha256 "92815de1947ffbd3049218799b848c88e9a737cbfcbeb19f436999602f607c1a"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.18/ks-darwin-amd64"
      sha256 "52a8d88f628a68d248dd0c61c2152a729dbb31bbee5a93c0876d860dd986ece6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.18/ks-linux-arm64"
      sha256 "82c0652672b2fb9420fbf578a4da67cbea1704b44b4105b2f8edfd017eb0a091"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.18/ks-linux-amd64"
      sha256 "3a24c2cca28918851f8e6cd769e95f0811f4b55544340278eecf7dcb9b6a631a"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
