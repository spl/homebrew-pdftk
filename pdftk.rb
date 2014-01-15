require 'formula'

class Pdftk < Formula
  homepage 'https://github.com/docmunch/pdftk'
  url 'https://github.com/docmunch/pdftk.git'
  version '2.02'

  head 'https://github.com/docmunch/pdftk.git', :branch => 'master'

  depends_on "Homebrew/versions/gcc48" => 'enable-all-languages' # or 'enable-java'

  def patches
    'https://raw2.github.com/docmunch/homebrew-pdftk/fbe14dbb13d65a6847fc70ad521719ea9ad1353f/patch.diff'
  end

  def install
    # Disable check on libstdc++ since we're using gcc and not clang.
    cxxstdlib_check :skip

    doc.mkpath
    doc.install 'changelog.html', 'changelog.txt', 'pdftk.1.html', 'pdftk.1.txt'
    man1.install 'pdftk.1'

    cd 'pdftk' do
      inreplace 'Makefile.OSX-10.6' do |s|
        s.gsub! '@HOMEBREW_PREFIX@', HOMEBREW_PREFIX
        s.gsub! '@PREFIX@', Formula.factory('gcc48').prefix
        s.gsub! '@GCC_TOOL_VERSION@', "#{Formula.factory('gcc48').version}".sub(/(\d\.\d).*/,'-\1')
        s.gsub! '@GCC_VERSION@', Formula.factory('gcc48').version
        s.gsub! '@BUILD@', "#{Formula.factory('gcc48').arch}-apple-darwin#{Formula.factory('gcc48').osmajor}"
      end

      system 'make', '-f', 'Makefile.OSX-10.6'
    end

    bin.install 'pdftk/pdftk'
  end

  test do
    system bin/'pdftk', '--version'
  end
end
