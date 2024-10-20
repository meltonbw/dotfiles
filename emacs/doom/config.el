
;; #+html: </details>
;; #+html: <details><summary>config.el</summary>

;; [[file:config.org::*File Headers][File Headers:3]]
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; DO NOT EDIT THIS FILE DIRECTLY
;; This is a file generated from a literate programing source file, config.org
;; You should make any changes there and regenerate it from Emacs org-mode
;; using org-babel-tangle (C-c C-v t)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; File Headers:3 ends here

;; User Information

;; My personal information.

;; [[file:config.org::*User Information][User Information:1]]
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ben Melton"
      user-mail-address "ben@themeltons.net")
;; User Information:1 ends here

;; UI behavior

;; Assign modifier keys and disable passing Control characters to the system, to avoid that =C-M-space= launches the Character viewer instead of running =mark-sexp=.

;; [[file:config.org::*UI behavior][UI behavior:1]]
(cond ((featurep :system 'macos)
       (setq mac-command-modifier       'meta
             mac-option-modifier        'alt
             mac-right-option-modifier  'alt
             mac-pass-control-to-system nil)))
;; UI behavior:1 ends here

;; Authentication source order

;; Doom configures =auth-sources= by default to include the Keychain on macOS, but it puts it at the beginning of the list. This causes creation of auth items to fail because the macOS Keychain sources do not support creation yet. Reverse it to leave =~/.authinfo.gpg= at the beginning.

;; [[file:config.org::*Authentication source order][Authentication source order:1]]
(cond ((featurep :system 'macos)
       (after! auth-source
         (setq auth-sources (nreverse auth-sources)))))
;; Authentication source order:1 ends here

;; [[file:config.org::*Capturing links to external applications][Capturing links to external applications:2]]
(when (featurep :system 'macos)
  (use-package! org-mac-link
    :after org
    :config
    (setq org-mac-grab-Acrobat-app-p nil) ; Disable grabbing from Adobe Acrobat
    (map! :map org-mode-map
          "C-c g"  #'org-mac-grab-link)))
;; Capturing links to external applications:2 ends here

;; Fonts


;; [[file:config.org::*Fonts][Fonts:1]]
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 11 :weight 'semi-light))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; Fonts:1 ends here



;; I like the dark Solarized theme. It's easy on the eyes.

;; [[file:config.org::*Themes][Themes:2]]
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-dark)
;; Themes:2 ends here

;; Line Numbering

;; I like line numbers.

;; [[file:config.org::*Line Numbering][Line Numbering:1]]
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;; Line Numbering:1 ends here

;; Word Counter

;; Enable a word count in the modeline. This is only shown for the modes listed in =doom-modeline-continuous-word-count-modes= (Markdown, GFM and Org by default).

;; [[file:config.org::*Word Counter][Word Counter:1]]
(setq doom-modeline-enable-word-count t)
;; Word Counter:1 ends here

;; [[https://github.com/doomemacs/doomemacs/tree/master/modules/ui/ligatures][Ligatures]]

;; I don't like ligatures in certain modes, such as =verilog-mode=. So, let's negate ligatures in these modes.

;; [[file:config.org::*\[\[https:/github.com/doomemacs/doomemacs/tree/master/modules/ui/ligatures\]\[Ligatures\]\]][[[https://github.com/doomemacs/doomemacs/tree/master/modules/ui/ligatures][Ligatures]]:1]]
(after! ligature
  (setq ligature-ignored-major-modes
        (cl-union ligature-ignored-major-modes '(verilog-mode
                                                 verilog-tsmode))))
;; [[https://github.com/doomemacs/doomemacs/tree/master/modules/ui/ligatures][Ligatures]]:1 ends here

;; Auto Save & Backup Files

;; We want the safety of auto-save and backup files.

;; [[file:config.org::*Auto Save & Backup Files][Auto Save & Backup Files:1]]
(setq auto-save-default t
      make-backup-files t)
;; Auto Save & Backup Files:1 ends here

;; [[https://orgmode.org/][Org-Mode]]

;; First, let's ensure we set the default source directory.

;; [[file:config.org::*\[\[https:/orgmode.org/\]\[Org-Mode\]\]][[[https://orgmode.org/][Org-Mode]]:1]]
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; [[https://orgmode.org/][Org-Mode]]:1 ends here

;; Indentation

;; Each hierarchy adds two spaces of indentation by default. In order to save horizontal space when editing, change this to one space.

;; [[file:config.org::*Indentation][Indentation:1]]
(after! org
  (setq org-indent-indentation-per-level 1))
;; Indentation:1 ends here



;; We also want to ensure Org does not add extra indentation to the text to match the heading.

;; [[file:config.org::*Indentation][Indentation:2]]
(after! org
  (setq org-adapt-indentation nil))
;; Indentation:2 ends here

;; Visuals

;; Let's hide the (N-1) stars of a heading to reduce visual noise.

;; [[file:config.org::*Visuals][Visuals:1]]
(after! org
  (setq org-hide-leading-stars 't))
;; Visuals:1 ends here



;; Hide emphasis and other markup until it actually needs to be edited.

;; [[file:config.org::*Visuals][Visuals:2]]
(after! org
  (setq org-hide-emphasis-markers t))
;; Visuals:2 ends here

;; Behavior

;; Insert Org headings at point, not after the current subtree (this is enabled by default by Doom).

;; [[file:config.org::*Behavior][Behavior:1]]
(after! org (setq org-insert-heading-respect-content nil))
;; Behavior:1 ends here

;; [[file:config.org::*\[\[https:/github.com/awth13/org-appear\]\[Org-Appear\]\]][[[https://github.com/awth13/org-appear][Org-Appear]]:2]]
(use-package! org-appear
  :defer t
  :hook (org-mode . org-appear-mode))
;; [[https://github.com/awth13/org-appear][Org-Appear]]:2 ends here



;; We want to reveal all Org entities.

;; [[file:config.org::*\[\[https:/github.com/awth13/org-appear\]\[Org-Appear\]\]][[[https://github.com/awth13/org-appear][Org-Appear]]:3]]
(after! org-appear
  (setq org-appear-autoemphasis t)
  (setq org-appear-autolinks t)
  (setq org-appear-autosubmarkers t)
  (setq org-appear-autoentities t)
  (setq org-appear-autokeywords t)
  (setq org-appear-inside-latex t))
;; [[https://github.com/awth13/org-appear][Org-Appear]]:3 ends here



;; Let's create a hook to reveal only when we are in =evil-mode='s insert mode. Note that org-appear expects to be enabled in Org mode buffers only, which is why the example attaches evil-mode hooks to the Org mode startup hook.

;; [[file:config.org::*\[\[https:/github.com/awth13/org-appear\]\[Org-Appear\]\]][[[https://github.com/awth13/org-appear][Org-Appear]]:4]]
(after! org-appear
  (setq org-appear-trigger 'manual)
  (add-hook 'org-mode-hook (lambda ()
                             (add-hook 'evil-insert-state-entry-hook
                                       #'org-appear-manual-start
                                       nil
                                       t)
                             (add-hook 'evil-insert-state-exit-hook
                                       #'org-appear-manual-stop
                                       nil
                                       t))))
;; [[https://github.com/awth13/org-appear][Org-Appear]]:4 ends here

;; [[file:config.org::*\[\[https:/github.com/yilkalargaw/org-auto-tangle\]\[Org-Auto-Tangle\]\]][[[https://github.com/yilkalargaw/org-auto-tangle][Org-Auto-Tangle]]:2]]
(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))
;; [[https://github.com/yilkalargaw/org-auto-tangle][Org-Auto-Tangle]]:2 ends here



;; Enable websockets for browser integration and configure the package. These are done after org-roam is loaded to reduce impact on Doom startup time.

;; [[file:config.org::*\[\[https:/github.com/org-roam/org-roam-ui\]\[Org-Roam-UI\]\]][[[https://github.com/org-roam/org-roam-ui][Org-Roam-UI]]:2]]
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
;; [[https://github.com/org-roam/org-roam-ui][Org-Roam-UI]]:2 ends here



;; This block selects enabled features.

;; [[file:config.org::*\[\[https:/github.com/gmlarumbe/verilog-ext\]\[Verilog-Ext\]\]][[[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:2]]
;; Can also be set through `M-x RET customize-group RET verilog-ext':
;;  - Verilog Ext Feature List (provides info of different features)
;; Comment out/remove the ones you do not need
(setq verilog-ext-feature-list
      '(font-lock
        xref
        capf
        hierarchy
        eglot
        lsp
;        lsp-bridge
;        lspce
        flycheck
        beautify
        navigation
        template
        formatter
        compilation
        imenu
        which-func
        hideshow
        typedefs
        time-stamp
        block-end-comments
        ports))
;; [[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:2 ends here



;; Then we load the module and set it up.

;; [[file:config.org::*\[\[https:/github.com/gmlarumbe/verilog-ext\]\[Verilog-Ext\]\]][[[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:3]]
(require 'verilog-ext)
(verilog-ext-mode-setup)
(add-hook 'verilog-mode-hook #'verilog-ext-mode)
;; [[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:3 ends here



;; We want to use tree-sitter by default for =*.v=, =*.sv=, =*.vh=, and =*.svh= files.

;; [[file:config.org::*\[\[https:/github.com/gmlarumbe/verilog-ext\]\[Verilog-Ext\]\]][[[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:4]]
;; To use `verilog-ts-mode' as the default major-mode also add the line below:
(add-to-list 'auto-mode-alist '("\\.s?vh?\\'" . verilog-ts-mode))
;; [[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:4 ends here



;; Finally, we set some miscellaneous options.

;; [[file:config.org::*\[\[https:/github.com/gmlarumbe/verilog-ext\]\[Verilog-Ext\]\]][[[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:5]]
(setq verilog-ext-tags-backend 'builtin)  ;; Use tree-sitter as the tags backend
(setq verilog-ext-hierarchy-backend 'vhier)   ;; Use vhier as the hierarchy backend
;; [[https://github.com/gmlarumbe/verilog-ext][Verilog-Ext]]:5 ends here
