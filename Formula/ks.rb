# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.1/ks-darwin-arm64"
      sha256 "5315d6f75a05857244d311289fc80b902faf6e39053a18bbe1bd5ea39ef75a82"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.1/ks-darwin-amd64"
      sha256 "a8e0f91ce6218cd169afb6620e0757e19063222c7e4dc3ff1d296857fc2d49dd"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.1/ks-linux-arm64"
      sha256 "f775fed92d6d30c5dfed9c641333fd54f5ba352deae10965d5378b158254aa71"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.1/ks-linux-amd64"
      sha256 "ef7f0b72430b30cbc14d4c4b2cc95e98b1e5625c8be1dd27d064e0fe6fd8a4df"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
