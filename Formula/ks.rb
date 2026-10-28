# ks — the KeepState CLI. Checksums pin the public-CI release artifacts.
class Ks < Formula
  desc "KeepState CLI: durable agent sessions (checkpoint, kill, wake, resume)"
  homepage "https://keepstate.ai"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.28/ks-darwin-arm64"
      sha256 "824dd32562db1c81111201fa9ee9098902372e3343d237279ce6af977b90d666"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.28/ks-darwin-amd64"
      sha256 "e795396442bd3acf296062ce73a87ef3bd7b2d5f302582f31a3ee69fb23d4121"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/keepstateai/cli/releases/download/v0.1.28/ks-linux-arm64"
      sha256 "6696bfcabcb342096ad53234722ce3ef0bcd0ec632bbf5bad72c3115f98d0b0c"
    else
      url "https://github.com/keepstateai/cli/releases/download/v0.1.28/ks-linux-amd64"
      sha256 "9e11cc3f454fba552926d89abda1ca0293cab31be8e8dc6b80905e488dee2c90"
    end
  end

  def install
    bin.install Dir["ks-*"].first => "ks"
  end

  test do
    assert_match "ks v", shell_output("#{bin}/ks version")
  end
end
