# Homebrew cask for the Foxora desktop app. Lives in the tap repo
# `foxora-ai/homebrew-tap` as Casks/foxora.rb → `brew install --cask foxora-ai/tap/foxora`.
# `version` + `sha256` are bumped on each `desktop-v*` release (the sha256 is of the
# universal DMG). The universal DMG runs natively on Apple Silicon AND Intel; the app
# self-updates via the Tauri updater (latest.json), so `auto_updates true`.
cask "foxora" do
  version "5.0.0"
  sha256 "00af70457a04549d02753bcf10a34ed8944350ad2f0b550605c1d1d98f958b21"

  url "https://github.com/foxora-ai/releases/releases/download/desktop-v#{version}/Foxora_#{version}_universal.dmg",
      verified: "github.com/foxora-ai/releases/"
  name "Foxora"
  desc "Local-first operating system for AI agents"
  homepage "https://foxora.ai/"

  auto_updates true
  depends_on macos: :big_sur

  app "Foxora.app"

  zap trash: [
    "~/.foxora",
    "~/Library/Application Support/ai.foxora.desktop",
    "~/Library/Application Support/foxora",
    "~/Library/Caches/ai.foxora.desktop",
    "~/Library/HTTPStorages/ai.foxora.desktop",
    "~/Library/LaunchAgents/ai.foxora.engine.plist",
    "~/Library/Preferences/ai.foxora.desktop.plist",
    "~/Library/Saved Application State/ai.foxora.desktop.savedState",
  ]
end
