# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.20/ks-darwin-arm64"
      sha256 "bbe9f208aa5fcb2c44cb21810c34435f4d3d4c257a06c53cb95a97ad8b7fb663"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.20/ks-darwin-amd64"
      sha256 "d80bc7ca5cbbae25d61cb0ce8367aa0655e390f78fae000e79b6fa068af9f2e0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.20/ks-linux-arm64"
      sha256 "56de385a8c75aaeac62281ed4668a30d30a7f51b4cbf7b3fa11d2692272f0f79"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.20/ks-linux-amd64"
      sha256 "9260b6e64949b3606c5234e029de6e13e8bb70d99696b202a475e837f40cdebd"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
