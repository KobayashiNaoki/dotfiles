(require 'epc)
(require 'auto-complete-config)
(require 'python)

;; PYTHONPATH上のソースコードがauto-completeの補完対象になる
;;(setenv "PYTHONPATH" "/usr/local/lib/python3.5/site-packages")
(setenv "PYTHONPATH" "/home/lr/kobayasi/.pyenv/versions/anaconda3-5.3.1/envs/pytorch_1.7.1_cuda10.2/lib/python3.8/site-packages/")
;; (setenv "PYTHONPATH" "/home/lr/kobayasi/.pyenv/versions/3.6.5/lib/python3.6/site-packages")
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq ac-sources
      (delete 'ac-source-words-in-same-mode-buffers ac-sources)) ;;jediの補完候補だけでいい
(add-to-list 'ac-sources 'ac-source-filename)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(define-key python-mode-map "\C-ct" 'jedi:goto-definition)
(define-key python-mode-map "\C-cb" 'jedi:goto-definition-pop-marker)
(define-key python-mode-map "\C-cr" 'helm-jedi-related-names)
