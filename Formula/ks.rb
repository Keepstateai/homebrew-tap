# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.50/ks-darwin-arm64"
      sha256 "2904362428f4f9d4a511f233c69f5ee3204f0b3050fc2ebf222b9acb9d455806"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.50/ks-darwin-amd64"
      sha256 "a028e07016231afe15b6613e48f69b72891b29a73f89e272e740ffa9230d651b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.50/ks-linux-arm64"
      sha256 "83d274d008b1a0f9ca2fc1cddf113b5853b8e8ef01e5373830bab794e61a3013"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.50/ks-linux-amd64"
      sha256 "8849b9f9cc1a41cb362301d9d8e2cadef6f4a65208365c4fb57a1c7c3e59dab5"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
