;; ---------------------------------------------------------------------
;; GNU Emacs / N Λ N O - Emacs made simple
;; Copyright (C) 2020 - N Λ N O developers
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.
;; ---------------------------------------------------------------------
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'vertico)
  (package-install 'vertico)
  (package-install 'marginalia)
  (package-install 'consult))

;; Path to nano emacs modules (mandatory)
(add-to-list 'load-path (expand-file-name "nano-emacs" user-emacs-directory))
(add-to-list 'load-path ".")

;; Default layout (optional)
(require 'nano-layout)

;; Theming Command line options (this will cancel warning messages)
(add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-help" . (lambda (args))))
(add-to-list 'command-switch-alist '("-compact" . (lambda (args))))


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Font
(setq nano-font-family-monospaced "JetBrains Mono"
      nano-font-family-proportional "JetBrains Sans"
      nano-font-size 10)

;; Chores
(setq backup-directory-alist '("~/.cache/emacs/backups")
      auto-save-list-file-prefix "~/.cache/emacs.d/autosave/"
      auto-save-file-name-transforms '((".*" "~/.cache/emacs.d/autosave/" t)))

;; Theme
(require 'nano-faces)
(require 'nano-theme)

(defun nano-theme-set-light ()
  "Apply light Nano theme base with Everforest Light colors."
  (setq frame-background-mode    'light)
  (setq nano-color-foreground "#5c6a72") ;; Dark grey-blue (Everforest fg)
  (setq nano-color-background "#fdf6e3") ;; Lightest bg (Everforest light bg)
  (setq nano-color-highlight  "#e4e1cd") ;; Slightly darker than bg
  (setq nano-color-critical   "#f85552") ;; Red (Everforest)
  (setq nano-color-salient    "#dfa000") ;; Gold (Everforest)
  (setq nano-color-strong     "#4c3743") ;; Darker fg (Everforest strong fg)
  (setq nano-color-popout     "#df69ba") ;; Pink (Everforest)
  (setq nano-color-subtle     "#a6b0a0") ;; Muted greenish grey (Everforest)
  (setq nano-color-faded      "#939f91") ;; Faded green (Everforest)
  (setq nano-theme-var "light"))

(defun nano-theme-set-dark ()
  "Apply dark Nano theme base with Everforest Dark colors."
  (setq frame-background-mode    'dark)
  (setq nano-color-foreground "#d3c6aa") ;; Soft beige (Everforest fg)
  (setq nano-color-background "#2d353b") ;; Darkest bg (Everforest dark bg)
  (setq nano-color-highlight  "#475258") ;; Slightly lighter than bg
  (setq nano-color-critical   "#e67e80") ;; Red (Everforest)
  (setq nano-color-salient    "#dbbc7f") ;; Yellow/Gold (Everforest)
  (setq nano-color-strong     "#e6e9ef") ;; Lightest fg (Everforest light fg)
  (setq nano-color-popout     "#d699b6") ;; Pink (Everforest)
  (setq nano-color-subtle     "#4f5b58") ;; Dark grey (Everforest subtle grey)
  (setq nano-color-faded      "#859289") ;; Faded greenish grey (Everforest)
  (setq nano-theme-var "dark"))

(nano-theme-set-dark)
(call-interactively 'nano-refresh-theme)

;; Nano default settings (optional)
(require 'nano-defaults)

;; Nano session saving (optional)
(require 'nano-session)

;; Nano header & mode lines (optional)
(require 'nano-modeline)

;; Nano key bindings modification (optional)
(require 'nano-bindings)

;; Welcome message (optional)
(let ((inhibit-message t))
  (message "Welcome to GNU Emacs / N Λ N O edition")
  (message (format "Initialization time: %s" (emacs-init-time))))

;; Splash (optional)
(require 'nano-splash)

;; Help (optional)
(require 'nano-help)

;; Nano Writer
(require 'nano-writer)

;; Nano Command
(require 'nano-command)

;; Nano Minibuffer
;; (require 'nano-minibuffer)

;; Nano Elfeed
;; (require 'nano-elfeed)

;; ORG MODE
(setq org-ellipsis "…")

(add-hook 'prog-mode-hook 'eglot-ensure)

(setq truncate-lines nil
      truncate-partial-width-windows t)

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (bash-mode . bash-ts-mode)
        (js2-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (json-mode . json-ts-mode)
        (css-mode . css-ts-mode)
        (python-mode . python-ts-mode)))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(vertico-mode 1)
(marginalia-mode 1)

(setq xref-show-xrefs-function #'consult-xref
      xref-show-definitions-function #'consult-xref)

(setq completion-in-region-function #'consult-completion-in-region)

(global-org-modern-mode 1)
