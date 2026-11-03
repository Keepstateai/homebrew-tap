# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.35/ks-darwin-arm64"
      sha256 "1603d86c28118cb8fc6ac951c7af61541fc3ace27e8d0fb79c314ca118f92ff7"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.35/ks-darwin-amd64"
      sha256 "9834ef40fe7450b0195072154bbc4b8119469904306cd4e314ae1860b0d5576c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.35/ks-linux-arm64"
      sha256 "b7894d14b860be0bdc291fef8272082242589d4258a2276a556f4078637588dc"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.35/ks-linux-amd64"
      sha256 "febffd1e3dc367831dd2fd0f3b9f5a60960dc38883e0a1b0c8c4e1e74bf474c5"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
