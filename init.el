; 言語を日本語に
(set-language-environment 'Japanese)
; UTF-8
(prefer-coding-system 'utf-8)

(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlomarugo")
(set-fontset-font "fontset-menlomarugo"
    'unicode
    (font-spec :family "Hiragino Maru Gothic Pro" :size 16)
    nil
    'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlomarugo"))

;(when (>= emacs-major-version 23)
; (setq fixed-width-use-QuickDraw-for-ascii t)
; (setq mac-allow-anti-aliasing t)
; (set-face-attribute 'default nil
;                     :family "monaco"
;                     :height 140)
; (set-fontset-font
;  (frame-parameter nil 'font)
;  'japanese-jisx0208
;  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
; (set-fontset-font
;  (frame-parameter nil 'font)
;  'japanese-jisx0212
;  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 ;;; Unicode フォント
; (set-fontset-font
;  (frame-parameter nil 'font)
;  'mule-unicode-0100-24ff
;  '("monaco" . "iso10646-1"))
;;; キリル，ギリシア文字設定
;;; 注意： この設定だけでは古代ギリシア文字、コプト文字は表示できない
;;; http://socrates.berkeley.edu/~pinax/greekkeys/NAUdownload.html が必要
;;; キリル文字
; (set-fontset-font
;  (frame-parameter nil 'font)
;  'cyrillic-iso8859-5
;  '("monaco" . "iso10646-1"))
;;; ギリシア文字
; (set-fontset-font
;  (frame-parameter nil 'font)
;  'greek-iso8859-7
;  '("monaco" . "iso10646-1"))
; (setq face-font-rescale-alist
;       '(("^-apple-hiragino.*" . 1.2)
;         (".*osaka-bold.*" . 1.2)
;         (".*osaka-medium.*" . 1.2)
;         (".*courier-bold-.*-mac-roman" . 1.0)
;         (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
;         (".*monaco-bold-.*-mac-roman" . 0.9)
;         ("-cdac$" . 1.3))))

(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)

;; 一日一ファイル
(setq howm-file-name-format "%Y/%m/%Y_%m_%d.howm")
;; キーワード一覧を ~/howm/.howm-keys に置く
(setq howm-keyword-file "~/howm/.howm-keys")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yatex の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq auto-mode-alist
;      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;(autoload 'yatex-mode "yatex" "Yet Another [[LaTeX]] mode" t)

(setq default-input-method "MacOSX")

;; 2009-08-31 amazon url
(defun tkr-link-Amazon ()
  (interactive)
  (let (end isbn)
    (end-of-line)
    (setq end (point))
    (beginning-of-line)
    (setq isbn (buffer-substring-no-properties (point) end))
    (insert "&lta href=\"http://www.amazon.co.jp/exec/obidos/ASIN/")
    (end-of-line)
    (insert "/interglacial-22/ref=nosim\">")
    (insert (format "&ltimg alt=\"ISBN %s\" border=\"0\" src=\"http://images-jp.amazon.com/images/P/%s.09.MZZZZZZZ.jpg\">" isbn isbn))
    (insert "</a>")))

;; コピー、ペースト
;(require 'mac-key-mode)
;(mac-key-mode 1)
