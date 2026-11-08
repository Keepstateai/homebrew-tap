# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.40/ks-darwin-arm64"
      sha256 "439cbc4921ac8e2b82422af8533ec5e61124d34c448919479a4e733fa4928aa5"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.40/ks-darwin-amd64"
      sha256 "513d4747c7d2abc0c77a9352562bd5ad359b209997db16198659cb96fd7e2018"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.40/ks-linux-arm64"
      sha256 "7382a2570efd9b26eddae6d59b3fcda9419779daa13f2752ec0c4c6761c2c3ba"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.40/ks-linux-amd64"
      sha256 "f69c3b669875563c0fd4daa90603233223dd4d0c8e080132fe80d51801636200"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
