# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.47/ks-darwin-arm64"
      sha256 "7c076f450858cdfef95b7e7c2f819ce1a1c65a572952c67eb2bfa052b533f9a4"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.47/ks-darwin-amd64"
      sha256 "a82ca4a18a253ab6bbb17c651bbf5609ac5ced8bd873841b26014b398add039c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.47/ks-linux-arm64"
      sha256 "ebcf3b9aeeb2eae4cd74c0c89bb1844a80b4527342b0b752796596b28fdaaab0"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.47/ks-linux-amd64"
      sha256 "a2dc89922e2b1ed7125dbb42d41110a184fbac7013bef93e369d2345b9f99cb0"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
