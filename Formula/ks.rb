# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.42/ks-darwin-arm64"
      sha256 "a88a1a9e181e6e702de6e8933c4e96953e950b5019bef8ae41f15ccd04f8b155"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.42/ks-darwin-amd64"
      sha256 "71d1d95e6942662130cce06a084b91b58a04c0a403e8d33053ed32dd67d01219"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.42/ks-linux-arm64"
      sha256 "b7236d4af8802935c0e2596878806cb9974c96c0f3896209bbc3f6dba6e89071"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.42/ks-linux-amd64"
      sha256 "17d903be1dbabea450ccdc39d01b15782e50eb8a0c2e0ac49bc5fdde3a57323a"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
