# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Hookdeck < Formula
  desc "Hookdeck CLI utility"
  homepage "https://hookdeck.com"
  version "0.9.3"
  depends_on :macos

  on_intel do
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.9.3/hookdeck_0.9.3_darwin_amd64.tar.gz"
    sha256 "9fced7a0c9c2b3c84846d82d8a73c970c38d821f1e6cd52d8a101445ea445090"

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
  on_arm do
    url "https://github.com/hookdeck/hookdeck-cli/releases/download/v0.9.3/hookdeck_0.9.3_darwin_arm64.tar.gz"
    sha256 "5128fc21549037a852174c9953811bcf5b1ab6888162fb67901810fe79c30614"

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

  def caveats
    <<~EOS
      ❤ Thanks for installing the Hookdeck CLI! If this is your first time using the CLI, be sure to run `hookdeck login` first.
    EOS
  end
end
