;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ansible
     auto-completion
     better-defaults
     c-c++
     csv
     dash
     emacs-lisp
     git
     (haskell :variables
              haskell-process-type 'stack-ghci
              haskell-completion-backend 'intero) ;stack install stylish-haskell hasktags hlint structured-haskell-mode
     html
     javascript
     markdown
     purescript
     python
     ruby
     rust
     scala
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     sql
     ;; syntax-checking
     version-control
     osx
     vinegar
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(thrift swift-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(company-ghc ghc-mod company-cabal)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the lisCustomer Setupt is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only) dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )
(defun dotspacemacs/user-init ()
  (add-hook 'haskell-mode-hook 'intero-mode)
)

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq powerline-default-separator 'box)
  (setq helm-echo-input-in-header-line nil)
  (setq haskell-tags-on-save nil)
  (global-auto-complete-mode)
  (global-linum-mode t)
  (linum-relative-global-mode t)
  (setq-default fill-column 100)
  (setq-default js2-basic-offset 2 js-indent-level 2)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(c-basic-offset 2)
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-keywords)
                  company-oddmuse company-dabbrev)))
 '(css-indent-offset 2)
 '(dired-use-ls-dired nil)
 '(electric-indent-mode nil)
 '(evil-shift-width 2)
 '(evil-want-Y-yank-to-eol nil)
 '(expand-region-contract-fast-key "V")
 '(expand-region-reset-fast-key "r")
 '(global-whitespace-mode t)
 '(haskell-check-command "/bin/true")
 '(haskell-compile-cabal-build-command "cd %s && stack build --ghc-options=-ferror-spans")
 '(haskell-hoogle-url "https://www.stackage.org/lts/hoogle?q=%s")
 '(helm-turn-on-recentf t)
 '(highlight-indentation-offset 2)
 '(package-selected-packages
   (quote
    (treepy graphql company-anaconda pos-tip ghub let-alist unfill mwim winum fuzzy company-ansible company-tern toml-mode racer cargo rust-mode tern phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic sql-indent yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org thrift tagedit swift-mode spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters pug-mode psci purescript-mode psc-ide popwin persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary orgit org org-plus-contrib org-bullets open-junk-file noflet neotree multi-term move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jinja2-mode intero flycheck info+ indent-guide ido-vertical-mode hydra hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter ghc gh-md flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emmet-mode elisp-slime-nav dumb-jump disaster diminish diff-hl dash-at-point csv-mode company-web web-completion-data dash-functional company-statistics company-ghci haskell-mode company-c-headers company column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format chruby bundler inf-ruby bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed ansible-doc ansible f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build spacemacs-theme stylish-haskell)))
 '(ring-bell-function (quote ignore))
 '(scala-indent:align-forms t)
 '(scala-indent:align-parameters t)
 '(scala-indent:default-run-on-strategy scala-indent:operator-strategy)
 '(swift-indent-offset 2)
 '(swift-indent-switch-case-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(whitespace-line-column 140)
 '(whitespace-style
   (quote
    (face tabs trailing indentation empty tab-mark lines))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

(setenv "DOCKER_TLS_VERIFY" "1")
(setenv "DOCKER_HOST" "tcp://192.168.99.100:2376")
(setenv "DOCKER_CERT_PATH" "/Users/dan/.docker/machine/machines/dev")
(setenv "DOCKER_MACHINE_NAME" "dev")
(setq ido-virtual-buffers '())
(setq recentf-list '())
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(c-basic-offset 2)
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-keywords)
                  company-oddmuse company-dabbrev)))
 '(css-indent-offset 2)
 '(dired-use-ls-dired nil)
 '(electric-indent-mode nil)
 '(evil-shift-width 2)
 '(evil-want-Y-yank-to-eol nil)
 '(expand-region-contract-fast-key "V")
 '(expand-region-reset-fast-key "r")
 '(global-whitespace-mode t)
 '(haskell-check-command "/bin/true")
 '(haskell-compile-cabal-build-command "cd %s && stack build --ghc-options=-ferror-spans")
 '(haskell-hoogle-url "https://www.stackage.org/lts/hoogle?q=%s")
 '(helm-turn-on-recentf t)
 '(highlight-indentation-offset 2)
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets writeroom-mode visual-fill-column symon string-inflection spaceline-all-the-icons seeing-is-believing ruby-refactor ruby-hash-syntax prettier-js pippel pipenv password-generator overseer nameless mvn meghanada maven-test-mode magit-svn json-navigator hierarchy importmagic epc ctable concurrent deferred impatient-mode htmlize helm-xref helm-rtags helm-purpose window-purpose imenu-list helm-git-grep groovy-mode groovy-imports pcache gradle-mode google-c-style gitignore-templates evil-lion evil-goggles evil-cleverparens paredit editorconfig doom-modeline eldoc-eval shrink-path all-the-icons memoize counsel-projectile counsel swiper ivy company-rtags rtags company-php ac-php-core xcscope company-emacs-eclim eclim centered-cursor-mode browse-at-remote font-lock+ dotenv-mode treepy graphql company-anaconda pos-tip ghub let-alist unfill mwim winum fuzzy company-ansible company-tern toml-mode racer cargo rust-mode tern phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic sql-indent yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org thrift tagedit swift-mode spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters pug-mode psci purescript-mode psc-ide popwin persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary orgit org org-plus-contrib org-bullets open-junk-file noflet neotree multi-term move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jinja2-mode intero flycheck info+ indent-guide ido-vertical-mode hydra hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter ghc gh-md flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emmet-mode elisp-slime-nav dumb-jump disaster diminish diff-hl dash-at-point csv-mode company-web web-completion-data dash-functional company-statistics company-ghci haskell-mode company-c-headers company column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format chruby bundler inf-ruby bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed ansible-doc ansible f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build spacemacs-theme stylish-haskell)))
 '(ring-bell-function (quote ignore))
 '(scala-indent:align-forms t)
 '(scala-indent:align-parameters t)
 '(scala-indent:default-run-on-strategy scala-indent:operator-strategy)
 '(swift-indent-offset 2)
 '(swift-indent-switch-case-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(whitespace-line-column 140)
 '(whitespace-style
   (quote
    (face tabs trailing indentation empty tab-mark lines))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
