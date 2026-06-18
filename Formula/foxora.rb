# Homebrew formula for the Foxora CLI. Lives in the tap repo `foxora-ai/homebrew-tap`
# as Formula/foxora.rb; `brew install foxora-ai/tap/foxora`. The `version` + the four
# `sha256`s are bumped by CI on each `cli-v*` release (the checksums are the
# foxora-<target>.tar.gz.sha256 files from the GitHub Release).
class Foxora < Formula
  desc "Agent terminal: fast, native CLI for running Foxora's AI agents"
  homepage "https://foxora.ai"
  version "5.0.0"
  base = "https://github.com/foxora-ai/releases/releases/download/cli-v#{version}"

  on_macos do
    on_arm do
      url "#{base}/foxora-aarch64-apple-darwin.tar.gz"
      sha256 "9808e804fe5175e2e07a1dd4817a1313c0a2525a86d619ed8aee4ea7a200df33"
    end
    on_intel do
      url "#{base}/foxora-x86_64-apple-darwin.tar.gz"
      sha256 "e3e4b6db2702b7f98f4f2af21e06817c412467893e341511e69c35954c40cc5f"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/foxora-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f91fbd73c61b50caf73c2b5e7e4f802f2688652f412b18e6531f27af7e8637c"
    end
    on_intel do
      url "#{base}/foxora-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07eec73ee090c47b8a79a574cb4730c0386e874f1f772dd6bfa9cebbe524914e"
    end
  end

  def install
    bin.install "foxora"
  end

  test do
    assert_match "foxora", shell_output("#{bin}/foxora --version")
  end
end
