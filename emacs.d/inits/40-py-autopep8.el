(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=200"))
(setq flycheck-flake8-maximum-line-length 200)
;; 保存時にバッファ全体を自動整形する
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
