# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.44/ks-darwin-arm64"
      sha256 "d3f456bfd464219b96eaf61218828e9cff76e065b2309727cb26ff7bed326d34"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.44/ks-darwin-amd64"
      sha256 "2cc804d9f8e066448e02e61ca0fcb4a45589be614713b93be89f152aa0de0921"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.44/ks-linux-arm64"
      sha256 "99ca587a06bbff42d0734c34b8340eb951da88d5334c8e4116fee6bb53f8fdb3"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.44/ks-linux-amd64"
      sha256 "1efa26f6890b3556d279d102267459fdc6c26725f5d5639566a9fff03393b8bf"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
