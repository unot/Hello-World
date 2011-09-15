### 重複したパスを登録しない
typeset -U path
## (N-/): 存在しないパスは登録しない
## パス(...): ...という条件にマッチするパスのみ残す
## N: NULL_GLOBオプションを設定
##    globがマッチしなかったり存在しないパスを無視する
## -: シンボリックリンク先のパスを評価
## /: ディレクトリのみ残す
path=(# システム用
  /bin(N-/)
  # 自分用
  $HOME/bin(N-/)
  # MacPorts用
  /opt/local/bin(N-/)
  # システム用
  /usr/local/bin(N-/)
  /usr/bin(N-/))

if type lv >/dev/null 2>&1 ; then
  ## lvを優先する
  export PAGER="lv"
else
  ## lvが無かったらlessを使う
  export PAGER="less"
fi

if [ "$PAGER" = "lv" ]; then
  ## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
  ## -l: 一行が長いと折り返されていても一行として扱う。
  export LV="-c -l"
else
  ## lvがなくてもlvでページャーを起動する。
  alias lv="$PAGER"
fi

### grepデフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない
GREP_OPTIONS="--binary-files=without-match"
### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrep
GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
### 拡張子が.tmpのファイルは無視する
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
### 管理用ディレクトリを無視する
if grep --help | grep -q -- --exclude-dir; then
  GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
  GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
  GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
  GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
fi
### 可能なら色をつける
if grep --help | grep -q -- --color; then
  GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi

### vimを使う
export EDITOR=vim
if ! type vim >/dev/null 2>&1 ; then
  alias vim=vi
fi


