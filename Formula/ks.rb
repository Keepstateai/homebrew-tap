# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.10/ks-darwin-arm64"
      sha256 "3427d21594d540af6d275c13fb2247a18d3d6e8a93514a96b57fe26c48d16c1f"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.10/ks-darwin-amd64"
      sha256 "325ee5aae7755f8d680302c3f340f79c9e590070998caaf9e517a2e70da3f7e4"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.10/ks-linux-arm64"
      sha256 "44e090186dac0ccaf660154e14592d227f452ab764361417489d74650f9f8941"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.10/ks-linux-amd64"
      sha256 "85b808226cdf602a2f4c4099b0440110a5c110a90d18725f6dd78809dd3f1c67"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
