# Homebrew formula for the Foxora CLI. Lives in the tap repo `foxora-ai/homebrew-tap`
# as Formula/foxora.rb; `brew install foxora-ai/tap/foxora`. The `version` + the four
# `sha256`s are bumped by CI on each `cli-v*` release (the checksums are the
# foxora-<target>.tar.gz.sha256 files from the GitHub Release).
class Foxora < Formula
  desc "Agent terminal: fast, native CLI for running Foxora's AI agents"
  homepage "https://foxora.ai"
  version "5.0.1"
  base = "https://github.com/foxora-ai/releases/releases/download/cli-v#{version}"

  on_macos do
    on_arm do
      url "#{base}/foxora-aarch64-apple-darwin.tar.gz"
      sha256 "d6f8525171a53e4031ed787f63f2a3b115dc134811d5b3745bdfb236a6fabd53"
    end
    on_intel do
      url "#{base}/foxora-x86_64-apple-darwin.tar.gz"
      sha256 "651f47149c1cdb51d97abbb1ca7951f11c3f9b1be3764ebf6d0e4330742cad08"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/foxora-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6935e1bd9cbccd02f2622df619c98eb9a3dd2b01ff7f5c287223179c6617594f"
    end
    on_intel do
      url "#{base}/foxora-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffbc1837149a9de954a01b062ce2f125b5b864c4db916fb6de7c5be13ebf951f"
    end
  end

  def install
    bin.install "foxora"
  end

  test do
    assert_match "foxora", shell_output("#{bin}/foxora --version")
  end
end
