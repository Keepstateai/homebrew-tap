# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.41/ks-darwin-arm64"
      sha256 "69d02f3fc6c12ab470ef75f399e90dacfa642889d0179699c78e84ad6df48526"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.41/ks-darwin-amd64"
      sha256 "7b95afa17a7e610dcff5e4bd9adb156e65b435dcdc1f065ea027b9332e4e4635"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.41/ks-linux-arm64"
      sha256 "048d29774a2f7d76d60a1e094213e94eb3a00e8fbfc071140c723ac290bda9aa"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.41/ks-linux-amd64"
      sha256 "dd7ce9bf375008ab4806bab078850256e38eabfa998eb02802fd80c3b7f7a1a7"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
