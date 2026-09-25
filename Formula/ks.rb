# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.11/ks-darwin-arm64"
      sha256 "aefc64792f0d75e4ac61ec0f78c50ceca64dd4e7421fa271e129cbf9a755fc7e"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.11/ks-darwin-amd64"
      sha256 "228de4e326f9d6e7dc1196e231445de99fc67e22e94f70e899c3758e526e8225"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.11/ks-linux-arm64"
      sha256 "82288c0b81d8f15a37a3cdbe51ff92b6e806a91c37e6a7f424548c0fbd5eec68"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.11/ks-linux-amd64"
      sha256 "4257b236b9a3196eb0f7d23467b4b0f7aab80cfebbcd623fc78c79d26522e5e7"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
