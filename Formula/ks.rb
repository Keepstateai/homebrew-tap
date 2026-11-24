# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.49/ks-darwin-arm64"
      sha256 "c2442f27dce430f1e668f9f10c79067eb50d0b741c3221fd8e423e4d6881ddf9"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.49/ks-darwin-amd64"
      sha256 "e445d409a35406ef6006bd2d245472f98d003effeef9b9cc2aba3be202debd4b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.49/ks-linux-arm64"
      sha256 "69c36e94319c949eb38cf73d9513cc14458b1d3590279ac291dd0375363830a2"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.49/ks-linux-amd64"
      sha256 "954dad0c1c53addf52c4b5f66692454eedb070b42f5062c0870c0c7516c8f24b"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
