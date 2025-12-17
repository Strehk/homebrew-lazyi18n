class Lazyi18n < Formula
  include Language::Python::Virtualenv

  desc "TUI for managing i18n translation files"
  homepage "https://github.com/Strehk/lazyi18n"

  url "https://github.com/Strehk/lazyi18n/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "adeebb265d19c5aeef1edad56e67edea8bd0813d4e0793b28fee7c76b8466e85"

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
