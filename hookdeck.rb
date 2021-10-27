# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Hookdeck < Formula
  desc "Hookdeck CLI utility"
  homepage "https://hookdeck.com"
  version "0.4.3"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.4.3/hookdeck_0.4.3_mac-os_arm64.tar.gz"
      sha256 "b3f483695aeff7b45ebac4571fdaa004384ff2290162dfd7dbb54ed880ce270e"

      def install
        bin.install "hookdeck"
        rm Dir["#{bin}/{hookdeck-completion.bash,hookdeck-completion.zsh}"]
        system bin/"hookdeck", "completion", "--shell", "bash"
        system bin/"hookdeck", "completion", "--shell", "zsh"
        bash_completion.install "hookdeck-completion.bash"
        zsh_completion.install "hookdeck-completion.zsh"
        (zsh_completion/"_hookdeck").write <<~EOS
          #compdef hookdeck
          _hookdeck () {
            local e
            e=$(dirname ${funcsourcetrace[1]%:*})/hookdeck-completion.zsh
            if [[ -f $e ]]; then source $e; fi
          }
        EOS
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.4.3/hookdeck_0.4.3_mac-os_x86_64.tar.gz"
      sha256 "761b5fea3854e66c720e95c7d508bf36c0a17e58418b0e1e66a87adc9c9d69c1"

      def install
        bin.install "hookdeck"
        rm Dir["#{bin}/{hookdeck-completion.bash,hookdeck-completion.zsh}"]
        system bin/"hookdeck", "completion", "--shell", "bash"
        system bin/"hookdeck", "completion", "--shell", "zsh"
        bash_completion.install "hookdeck-completion.bash"
        zsh_completion.install "hookdeck-completion.zsh"
        (zsh_completion/"_hookdeck").write <<~EOS
          #compdef hookdeck
          _hookdeck () {
            local e
            e=$(dirname ${funcsourcetrace[1]%:*})/hookdeck-completion.zsh
            if [[ -f $e ]]; then source $e; fi
          }
        EOS
      end
    end
  end

  def caveats; <<~EOS
    ❤ Thanks for installing the Hookdeck CLI! If this is your first time using the CLI, be sure to run `hookdeck login` first.
  EOS
  end
end
