# Homebrew formula for the Foxora CLI. Lives in the tap repo `foxora-ai/homebrew-tap`
# as Formula/foxora.rb; `brew install foxora-ai/tap/foxora`. The `version` + the four
# `sha256`s are bumped by CI on each `cli-v*` release (the checksums are the
# foxora-<target>.tar.gz.sha256 files from the GitHub Release).
class Foxora < Formula
  desc "Agent terminal: fast, native CLI for running Foxora's AI agents"
  homepage "https://foxora.ai"
  version "5.0.2"
  base = "https://github.com/foxora-ai/releases/releases/download/cli-v#{version}"

  on_macos do
    on_arm do
      url "#{base}/foxora-aarch64-apple-darwin.tar.gz"
      sha256 "098339ef80aab9715c3c3f8b131b968b1ce2489dfceaa6fc8e79d93aa3b8d16d"
    end
    on_intel do
      url "#{base}/foxora-x86_64-apple-darwin.tar.gz"
      sha256 "b1008275327ef5b777ebda04d2bf8fc2e1e190e5d409b6cffafe1a8b757dc419"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/foxora-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65dd30a799314191f8b4242732493e8fa3b67b0f9d57ff7d645e4d20c5a6e4bc"
    end
    on_intel do
      url "#{base}/foxora-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ffc22052302e51576c0c8cb22f317fa03215acdcf586772cbc9268d56026415"
    end
  end

  def install
    bin.install "foxora"
  end

  test do
    assert_match "foxora", shell_output("#{bin}/foxora --version")
  end
end
