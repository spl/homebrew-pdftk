require 'formula'

class Pdftk < Formula
  homepage 'https://github.com/docmunch/pdftk'
  url 'https://github.com/docmunch/pdftk.git', :tag => "v2.02"

  head 'https://github.com/docmunch/pdftk.git', :branch => 'master'

  depends_on 'ecj'
  depends_on 'gcc' => ['with-all-languages'] # or 'with-java'

  def patches
    'https://raw.githubusercontent.com/docmunch/homebrew-pdftk/master/patch.diff'
  end

  def install
    # Disable check on libstdc++ since we're using gcc and not clang.
    cxxstdlib_check :skip

    doc.mkpath
    doc.install 'changelog.html', 'changelog.txt', 'pdftk.1.html', 'pdftk.1.txt', 'license_gpl_pdftk'
    man1.install 'pdftk.1'

    cd 'pdftk' do
      gcc = Formula['gcc']
      inreplace 'Makefile.OSX-10.6' do |s|
        s.gsub! '@HOMEBREW_PREFIX@', HOMEBREW_PREFIX
        s.gsub! '@PREFIX@', gcc.prefix
        s.gsub! '@GCC_VERSION@', gcc.version
        s.gsub! '@GCC_VERSION_SUFFIX@', gcc.version_suffix
      end

      system 'make', '-f', 'Makefile.OSX-10.6'
    end

    bin.install 'pdftk/pdftk'
  end

  test do
    system bin/'pdftk', '--version'
  end
end
