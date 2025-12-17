class Lazyi18n < Formula
  include Language::Python::Virtualenv

  desc "TUI for managing i18n translation files"
  homepage "https://github.com/Strehk/lazyi18n"

  url "https://github.com/Strehk/lazyi18n/releases/download/v0.2.1/lazyi18n-0.2.1.tar.gz"
  sha256 "a0eba68d9e20f460762849e54486aa20a5cedae829c9e2bed5bf4bfcbd7d5db0"

  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_create(libexec, "python3.14")
    system libexec/"bin/python", "-m", "pip", "install", "."
    bin.install_symlink libexec/"bin/lazyi18n"
  end

  test do
    assert_match "lazyi18n", shell_output("#{bin}/lazyi18n --version")
  end
end
