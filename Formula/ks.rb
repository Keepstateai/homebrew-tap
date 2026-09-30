# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.19/ks-darwin-arm64"
      sha256 "de2184107482b7551aeda66ac605657eec202d3f838ee2d94d90708aabbd4af1"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.19/ks-darwin-amd64"
      sha256 "2031725cfecac21e2394b741dbd58d2a8d9ede88c390330e464e975ac00f210f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.19/ks-linux-arm64"
      sha256 "c9db9a618d5a95ed4889a27cf2ec0ec92cfe49ec44c777d91547f0468da478d9"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.19/ks-linux-amd64"
      sha256 "9ce5de49d7269ef9e78e8aac6d7d0d111708849dc207445773a1d669e9557d3e"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
