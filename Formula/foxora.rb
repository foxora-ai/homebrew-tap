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
      sha256 "f3d776f7e47817a3c048037316110badf12285bcd28f50c798051a66e4f8b13d"
    end
    on_intel do
      url "#{base}/foxora-x86_64-apple-darwin.tar.gz"
      sha256 "16bb415ce4e7f278cff9b53646fb60f8c76911bfbc51c9b2628d80be725ab788"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/foxora-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f6e69ab5e537e174bb0c30bef17cf54abededed1301b7f4a00dbe563592c05b"
    end
    on_intel do
      url "#{base}/foxora-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1288b9151912a7408ff95f844106b325bbdd960d7b057f302db2ea75e2e2c696"
    end
  end

  def install
    bin.install "foxora"
  end

  test do
    assert_match "foxora", shell_output("#{bin}/foxora --version")
  end
end
