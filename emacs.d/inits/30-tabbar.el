(require 'tabbar)
(tabbar-mode)
;; scratchタブを消す
(when (require 'tabbar nil t)
  (setq tabbar-buffer-groups-function
	(lambda () (list "All Buffers")))
  (setq tabbar-buffer-list-function
	(lambda ()
	  (remove-if
	   (lambda(buffer)
	     (find (aref (buffer-name buffer) 0) " *"))
	   (buffer-list))))
  (tabbar-mode))
;; キーバインド
(global-set-key "\M-n" 'tabbar-forward)  ; 次のタブ
(global-set-key "\M-p" 'tabbar-backward) ; 前のタブ
;; タブ上でマウスホイールを使わない
(tabbar-mwheel-mode nil)
;; グループを使わない
(setq tabbar-buffer-groups-function nil)
;; 画像を使わないことで軽量化する
(setq tabbar-use-images nil)
;; 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
	       tabbar-scroll-left-button
	       tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
		 (cons "" nil))))
;; タブのセパレーターの長さ
(setq tabbar-separator '(2.0))
;; 色設定
(set-face-attribute ; バー自体の色
 'tabbar-default nil
 :background "brightwhite"
 :family "Inconsolata"
 :height 1.0)
(set-face-attribute ; アクティブなタブ
 'tabbar-selected nil
 :background "cyan"
 :foreground "brightwhite"
 :weight 'bold
 :box nil)
(set-face-attribute ; 非アクティブなタブ
 'tabbar-unselected nil
 :background "brightwhite"
 :foreground "black"
 :box nil)
