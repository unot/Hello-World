#!/bin/sh -e
# ref: http://masawada.hatenablog.jp/entry/2014/07/12/153947
sudo -k
sudo sh <<SCRIPT
  tlmgr update --self --all
  tlmgr install ptex ptex2pdf jfontmaps jsclasses japanese-otf
  mkdir -p /usr/local/texlive/2014basic/texmf-local/fonts/opentype/local/hiragino
  cd /usr/local/texlive/2014basic/texmf-local/fonts/opentype/local/hiragino/
  ln -fs "/Library/Fonts/ヒラギノ明朝 Pro W3.otf" ./HiraMinPro-W3.otf
  ln -fs "/Library/Fonts/ヒラギノ明朝 Pro W6.otf" ./HiraMinPro-W6.otf
  ln -fs "/Library/Fonts/ヒラギノ丸ゴ Pro W4.otf" ./HiraMaruPro-W4.otf
  ln -fs "/Library/Fonts/ヒラギノ角ゴ Pro W3.otf" ./HiraKakuPro-W3.otf
  ln -fs "/Library/Fonts/ヒラギノ角ゴ Pro W6.otf" ./HiraKakuPro-W6.otf
  ln -fs "/Library/Fonts/ヒラギノ角ゴ Std W8.otf" ./HiraKakuStd-W8.otf
  mktexlsr
  updmap-sys --setoption kanjiEmbed hiragino

  tlmgr install framed wrapfig upquote collection-fontsrecommended
  cd /var/tmp && wget http://ftp.kddilabs.jp/TeX/ptex-win32/current/otfbeta.tar.xz
  tar xvf otfbeta.tar.xz
  cd share/texmf-dist/
  cp -Rv * /usr/local/texlive/2014basic/texmf-local/
  mktexlsr
  cd /var/tmp & rm -rf share otfbeta.tar.xz
SCRIPT

