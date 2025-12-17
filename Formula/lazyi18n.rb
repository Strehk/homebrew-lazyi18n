class Lazyi18n < Formula
  include Language::Python::Virtualenv

  desc "TUI for managing i18n translation files"
  homepage "https://github.com/Strehk/lazyi18n"

  url "https://github.com/Strehk/lazyi18n/releases/download/v0.2.0/lazyi18n-0.2.0.tar.gz"
  sha256 "1fee28f92956b095d5190b3ccc6e049f82bb94fc6ed8f4d5983d30aa304202a4"

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
