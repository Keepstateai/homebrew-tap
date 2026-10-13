# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.22/ks-darwin-arm64"
      sha256 "0c2c37875177b11268d7e8955f8c1233bde33620791b92e372c6eb40a47ab7d5"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.22/ks-darwin-amd64"
      sha256 "422aafe6eba9309e080508aa2c36a353154dd619ed82d0216518840f83068877"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.22/ks-linux-arm64"
      sha256 "3dea5ecb6365a20d126d5b6c6969386cdf40aaa45895758498aff818ac0b6ec8"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.22/ks-linux-amd64"
      sha256 "c17465ae93ecc27bf6ae381a88771b57acfae96a4ba74f3100b2df0f28ece296"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
