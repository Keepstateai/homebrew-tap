# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/esrygrtc/cli/releases/download/v0.1.0/ks-darwin-arm64"
      sha256 "6e4d0c182ae9404bd9560d7d9f0d4722bf07bbbba35374539c0e02577c828abb"
    else
      url "https://github.com/esrygrtc/cli/releases/download/v0.1.0/ks-darwin-amd64"
      sha256 "6528ac796aba0b3c29438897a72f1fe185c60f6285dba7f2ab9c781f295d96b0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/esrygrtc/cli/releases/download/v0.1.0/ks-linux-arm64"
      sha256 "8012f52de609783423780d260b7e60c1fa455b342779b016e7dec3f2579e0d3f"
    else
      url "https://github.com/esrygrtc/cli/releases/download/v0.1.0/ks-linux-amd64"
      sha256 "0e831fa027f41176bcb70371b2a9c492666c37ef594b10d78d0fb7ad27d6ce52"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
