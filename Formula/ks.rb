# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.13/ks-darwin-arm64"
      sha256 "853944931a72e1929c8ec921d866f7321064652a9ea5cdef410707bf46c51569"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.13/ks-darwin-amd64"
      sha256 "3b5870544d3158582eddd1dcb9c5800768f94ec826da408d900065a03ad74907"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.13/ks-linux-arm64"
      sha256 "c2f628fd34fcae07d054bd643faddcec7eae3f1f26fb357cbb4f9d2e8e9098af"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.13/ks-linux-amd64"
      sha256 "ec970b0d3e8a8ea70bf1da4f47f2f1659b7392142df351eccc7b39d24c5dabb7"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
