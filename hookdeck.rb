# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Hookdeck < Formula
  desc "Hookdeck CLI utility"
  homepage "https://hookdeck.com"
  version "0.6.6"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.6.6/hookdeck_0.6.6_darwin_arm64.tar.gz"
      sha256 "244dd768e87303412e1fddf5dfd7b649985bd883d37dcd903fd32eb38aeb1f39"

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
      url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.6.6/hookdeck_0.6.6_darwin_amd64.tar.gz"
      sha256 "c48699d63334dcf9d9854ae24df7c74b5b6afee3e2080ad0ccaf699bf4ff5335"

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
