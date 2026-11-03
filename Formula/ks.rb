# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.34/ks-darwin-arm64"
      sha256 "685515dfcb3fd42a936e0d7586c9e079fc76bd0fe977ac1850b04fe06f38863d"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.34/ks-darwin-amd64"
      sha256 "c6827b2b8d5b06e3bd7d316707d2b2c79f462a184921d8b98cb4c6498266008a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.34/ks-linux-arm64"
      sha256 "aac7cda7e88c5b020c6dd162d9df24e386845869bd981b79b7168c2686a40d13"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.34/ks-linux-amd64"
      sha256 "66f43951cf4947623ed242591edca140f4a5ca7970e4108c34cb5de763b84c71"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
