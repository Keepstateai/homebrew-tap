# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.33/ks-darwin-arm64"
      sha256 "fcd9b06ae267a38f3e911c6c9ab6adede3b12a73fb13b0b5bb9a6243d36df7a4"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.33/ks-darwin-amd64"
      sha256 "f2fd61d1f38e90d57562b7afab86bf57757eb43f8223063126f4b9f2223d804f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.33/ks-linux-arm64"
      sha256 "6beac8c665639b245ecd74f08defa38f6f5a0e4858234ac220de7670b833940a"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.33/ks-linux-amd64"
      sha256 "2bf0ac6ef03d9b7bea07a77061e7b88025365323d7d1b92f17e875deb1b5c0c7"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
