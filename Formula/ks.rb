# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.39/ks-darwin-arm64"
      sha256 "1fe0e3c478b666d5fb058f00d117b56b496fd3d2d24c3260c20b843156ec3a4e"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.39/ks-darwin-amd64"
      sha256 "3ae04e28c55ca5a671805a8e769381735b4d3136cf9c53ddba4b0ed182042c7f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.39/ks-linux-arm64"
      sha256 "e888007b7537a607611b476d2e0236c06268db671c3881ef840be8b513978d11"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.39/ks-linux-amd64"
      sha256 "0f5d8310fb604d4bed80de15f5b5c72df8d812a433daeaa4029430482412ae16"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
