# Homebrew formula for cdx. Rendered by scripts/render-packaging.sh at release time.
class Cdx < Formula
  desc "Fast, cross-platform interactive directory navigator that extends cd"
  homepage "https://github.com/vinayakkuradia/cdx"
  version "1.0.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/vinayakkuradia/cdx/releases/download/v1.0.0/cdx-aarch64-apple-darwin.tar.gz"
      sha256 "f5ce3465e300de8b1b889ca2b45c2990e950df2125a43618d70e2b01c014d947"
    end
    on_intel do
      url "https://github.com/vinayakkuradia/cdx/releases/download/v1.0.0/cdx-x86_64-apple-darwin.tar.gz"
      sha256 "e76880ecc8d026239e0c75d60727812bfad726cfbb8ef34bb4244ad8c76bd0eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vinayakkuradia/cdx/releases/download/v1.0.0/cdx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0672dbcab8bed6d954b580834f9f061f998390fa15f3884a19f97d74e830d36a"
    end
    on_intel do
      url "https://github.com/vinayakkuradia/cdx/releases/download/v1.0.0/cdx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5dffe7767c979a373ad9b9e0a644201a56d52ec164a4849c643b5df9fffb5b38"
    end
  end

  def install
    bin.install "cdx-bin"
  end

  def caveats
    <<~EOS
      cdx needs a small shell function to change your shell's folder.
      Add one line to your shell config, then open a new terminal:

        bash:  eval "$(cdx-bin init bash)"     (in ~/.bashrc)
        zsh:   eval "$(cdx-bin init zsh)"      (in ~/.zshrc)
        fish:  cdx-bin init fish | source      (in ~/.config/fish/config.fish)
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cdx-bin --version")
    assert_match "function", shell_output("#{bin}/cdx-bin init fish")
  end
end
