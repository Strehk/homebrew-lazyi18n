class Lazyi18nNightly < Formula
  include Language::Python::Virtualenv

  desc "TUI for managing i18n translation files"
  homepage "https://github.com/Strehk/lazyi18n"

  url "https://github.com/Strehk/lazyi18n/releases/download/nightly/lazyi18n-0.1.1.dev20251217152152.tar.gz"
  sha256 "5ac984471143bcbc029b32abfdd283ca013253dc37dd87ef73439e316a8bd9e1"

  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_create(libexec, "python3.14")
    system libexec/"bin/python", "-m", "pip", "install", "."
    bin.install_symlink libexec/"bin/lazyi18n" => "lazyi18n-nightly"
  end

  test do
    assert_match "lazyi18n-nightly", shell_output("#{bin}/lazyi18n-nightly --version")
  end
end
