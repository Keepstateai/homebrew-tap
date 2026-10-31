# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.32/ks-darwin-arm64"
      sha256 "b5d015d26847a893a828fe31efb3a0fb6a3145f78aa6beab66e3d1065d0d51b5"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.32/ks-darwin-amd64"
      sha256 "eefbdb6e1525edadc13605e4a0f3ad5b9db2f62d8e1fbb466435256bae437659"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.32/ks-linux-arm64"
      sha256 "33230896a0f1b7868c32adec5454c4263e53269fc54b523270282c8cbd9b29b9"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.32/ks-linux-amd64"
      sha256 "f16806e368d4f374db0454274e9c8b13febe757f09e4dc1e94d09c9cdf9ff0e5"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
