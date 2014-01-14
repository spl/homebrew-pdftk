require 'formula'

class Pdftk < Formula
  homepage 'https://github.com/docmunch/pdftk'
  url 'https://github.com/docmunch/pdftk.git'
  version '2.02'

  head 'https://github.com/docmunch/pdftk.git', :branch => 'master'

  def gcc
    'gcc48'
  end

  depends_on "Homebrew/versions/#{gcc}" => 'enable-all-languages' # or 'enable-java'

  def patches
    'https://raw.github.com/docmunch/homebrew-pdftk/master/patch.diff'
  end

  def install
    doc.mkpath
    doc.install 'changelog.html', 'changelog.txt', 'pdftk.1.html', 'pdftk.1.txt'
    man1.install 'pdftk.1'

    cd 'pdftk' do
      inreplace 'Makefile.OSX-10.6' do |s|
        s.gsub! '@HOMEBREW_PREFIX@', "#{HOMEBREW_PREFIX}"
        s.gsub! '@PREFIX@', "#{Formula.factory(gcc).prefix}"
        s.gsub! '@GCC_TOOL_VERSION@', "#{Formula.factory(gcc).version}".sub(/(\d\.\d).*/,'\1')
        s.gsub! '@GCC_VERSION@', "#{Formula.factory(gcc).version}"
        s.gsub! '@BUILD@', "#{Formula.factory(gcc).arch}-apple-darwin#{Formula.factory(gcc).osmajor}"
      end

      system 'make', '-f', 'Makefile.OSX-10.6'
      system 'make', '-f', 'Makefile.OSX-10.6', 'install'
    end
  end

  test do
    system bin/'pdftk', '--version'
  end
end
