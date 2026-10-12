# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.21/ks-darwin-arm64"
      sha256 "f84bb4e32d1b5e22c26338814c0c4bb2997d12947c6f850bece35ff3346c5a4e"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.21/ks-darwin-amd64"
      sha256 "3b5e6fedec9b682320c1a031af61861a2e21e9d2fd55702f9ce8d83dee9647ec"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.21/ks-linux-arm64"
      sha256 "b20f5cbba50e4e526cd88541158240648bfc0fe13bb1e559b78305b477c5b7d0"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.21/ks-linux-amd64"
      sha256 "359f58ef7068457b70e79e3fdc20453e4bcad3332b60f483aa068c0336ed801a"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
