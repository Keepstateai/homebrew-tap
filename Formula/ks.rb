# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.51/ks-darwin-arm64"
      sha256 "1132d8725e5341ac4460167b792db341b6d8b1ad48653ecdf23fb5dffd7f8768"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.51/ks-darwin-amd64"
      sha256 "4dd264a13d04beadfff5048052e0bb3749acb73956e022425eb4cfe846d0d07e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.51/ks-linux-arm64"
      sha256 "c10c95009155d21d794bbea8de016135e42ad63d39ac9ab047e92f343bf76d80"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.51/ks-linux-amd64"
      sha256 "d2a25480918d4a8e60cc642926a27ab08e7cfcd60d6627f03ae132f561e97dc0"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
