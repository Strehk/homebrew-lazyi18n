class Lazyi18n < Formula
  include Language::Python::Virtualenv

  desc "TUI for managing i18n translation files"
  homepage "https://github.com/Strehk/lazyi18n"

  url "https://github.com/Strehk/lazyi18n/releases/download/v0.1.5/lazyi18n-0.1.5.tar.gz"
  sha256 "e246ec7aaf97443d8dc7d022b36f2597a1ca7397d8bfaac499f89011c01b2b1e"

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
