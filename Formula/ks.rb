# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.2/ks-darwin-arm64"
      sha256 "95d6420006184eda14ad24b76027da7d0cb589f3a030eb29740c4209dea3d8cc"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.2/ks-darwin-amd64"
      sha256 "05f5d086b560f27d8aa2ede24510ef3da220b327c5b0d1d4dd33da4fdceafce7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.2/ks-linux-arm64"
      sha256 "99b1400b6df5166faf946306436bd843eebde8457320d3dbb784102076774970"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.2/ks-linux-amd64"
      sha256 "7fc2a76fa7163fdacc6b7f720f3c53874104fa68fef8bbde0ae5bfa71a70c331"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
