# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.43/ks-darwin-arm64"
      sha256 "50def06f1bc98fd16b7c7225690151e87311c6bf06dc011fa1717042e147ddd0"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.43/ks-darwin-amd64"
      sha256 "3a198c94482084f038d187f0f2dde71f1e6b56f4e619535ba2079327630d2c0e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.43/ks-linux-arm64"
      sha256 "a9b59e577c79ba2762c23435670f100bb0c9a1de371fe6d7f61ce793731e1c91"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.43/ks-linux-amd64"
      sha256 "67860ec15ba7de9e6cde27038a1204b43e491bb5e6d78e947b6bc1b0c77b1fa7"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
