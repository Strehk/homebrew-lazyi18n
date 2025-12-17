class Lazyi18n < Formula
  include Language::Python::Virtualenv

  desc "TUI for managing i18n translation files"
  homepage "https://github.com/Strehk/lazyi18n"

  url "https://github.com/Strehk/lazyi18n/releases/download/v0.1.7/lazyi18n-0.1.7.tar.gz"
  sha256 "d9f04073721ede974b8749e63414061640d74ef220b1d9affdb5a2d0d84a9c59"

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
