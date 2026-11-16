# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.46/ks-darwin-arm64"
      sha256 "be3b5d308f875bf2bfaa0eb1b463339d0998e2e87889a6f54fa1eff1a4235a05"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.46/ks-darwin-amd64"
      sha256 "5b3a05e36b92bd349f743c5a2c27022ab75d0a01e54eac22552bff7cdf3333e8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.46/ks-linux-arm64"
      sha256 "decb30c8ab3151eacbeb6ed8ac08dbe65bfcd6751ff8853ab530a3f4dc6511ed"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.46/ks-linux-amd64"
      sha256 "032fe9c4404b1158d2c3d733e8653586bafd35672010f0758d19f32a047b2bc0"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
