# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.12/ks-darwin-arm64"
      sha256 "14d897f015ac397e5b0acf838ee725624938c64eee57281eb670a56f941ddfcb"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.12/ks-darwin-amd64"
      sha256 "ed900f276c6f9fcde6373172636acd22799281de9a094dd9c0fba3f821b413a0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.12/ks-linux-arm64"
      sha256 "8153d01b1f5aa83d94af576f37224574b2e10d0800844f6322c316da0bd9570b"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.12/ks-linux-amd64"
      sha256 "b334e9e15d49d79b6970be05b59c76a51d5893532183112727aaa9e7069c80bc"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
