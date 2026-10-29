# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.30/ks-darwin-arm64"
      sha256 "cc138e2dcb7107a0313a562457310236085ec7ecb50b203a47b830c1aabe2883"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.30/ks-darwin-amd64"
      sha256 "9f86c66951b2bd485ae0396a02183b3757b1b752b5d6ab833becf2d3c540c844"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.30/ks-linux-arm64"
      sha256 "4c98bae22ac413dbb0c535ae0d2a7fa3f97b6becb3ec169ac73ecacba160acad"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.30/ks-linux-amd64"
      sha256 "d7712813996bbd5536a2422badb4c95fac9d95410a794ba6da66ef707c8ab8a2"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
