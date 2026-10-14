# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.23/ks-darwin-arm64"
      sha256 "440fc352a20b6a33e6c39a025207f8068aa8eb4c6c753704d0b75fec889a7fa6"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.23/ks-darwin-amd64"
      sha256 "5cd08bcfaa2228b471f21a07f1d5bd5b51fe99d523f973ca426f3227e3a41dae"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.23/ks-linux-arm64"
      sha256 "987b006cec0bd60869023cd1458808da5d81270c3c2994747e2e5c28361ac4f0"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.23/ks-linux-amd64"
      sha256 "b48f7e6d2050a406761601204d745d0241a29fbc47c16a13e32ee95b7acb7331"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
