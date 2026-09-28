# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.14/ks-darwin-arm64"
      sha256 "27aeefc0b5cd9dbfc6b301257f70ffb735b888123a03d913167a7cb80badcfcc"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.14/ks-darwin-amd64"
      sha256 "3300e3ac26e937114446da5a4739632129d9edd22b75765091c7414693cb15f5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.14/ks-linux-arm64"
      sha256 "5ce9d6ab03df16208d3deffd62e0b5b7edfc76859da6630824493a3c6d3d0bbf"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.14/ks-linux-amd64"
      sha256 "31aece5311048bddf3974ec74562a6b9d1b513279d9681f7713995277fa15812"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
