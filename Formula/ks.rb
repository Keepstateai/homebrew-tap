# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.16/ks-darwin-arm64"
      sha256 "ce21c0a6f18b39122ddb936a124f46ddfa1b6252c778f80be36b2f401529d2fc"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.16/ks-darwin-amd64"
      sha256 "cc652a64a9ca5c029a047c857503e351cc6f2efc3a8a7f05bdeec26aa1725481"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.16/ks-linux-arm64"
      sha256 "c98b30b39a774eb7fc029d4513f4031e7703deed1ac877c7e44af1ab703ca592"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.16/ks-linux-amd64"
      sha256 "aae96965a309c754ebcbeb11875fe7c707be6898e472ccd609221d60a1288a55"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
