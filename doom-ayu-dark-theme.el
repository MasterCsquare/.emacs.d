;;; doom-ayu-dark-theme.el -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-ayu-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-ayu-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-ayu-dark-theme
  :type 'boolean)

(defcustom doom-ayu-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-ayu-dark-theme
  :type 'boolean)

(defcustom doom-ayu-dark-comment-bg doom-ayu-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-ayu-dark-theme
  :type 'boolean)

(defcustom doom-ayu-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-ayu-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-ayu-dark
  "A dark theme in ayu"

  ;; name        default   256       16
  ((bg         '("#0a0e14" nil       nil            ))
   (bg-alt     '("#13181c"nil       nil            ))
   (base0      '("#0c1016""black"   "black"        ))
   (base1      '("#12171b""#111122" "brightblack"  ))
   (base2      '("#192025""#222222" "brightblack"  ))
   (base3      '("#20282f""#223333" "brightblack"  ))
   (base4      '("#2c3740""#334455" "brightblack"  ))
   (base5      '("#445461""#556677" "brightblack"  ))
   (base6      '("#536676""#668899" "brightblack"  ))
   (base7      '("#658092""#77AABB" "brightblack"  ))
   (base8      '("#7c8895""#99AABB" "white"        ))
   (fg-alt     '("#5b7080""#7788AA" "brightwhite"  ))
   (fg         '("#b3b1ad" "#AABBCC" "white"        ))

   (grey        '("#626a73" "#ff6655" "red"          ))
   (red         '("#f07178" "#ff6655" "red"          ))
   (orange      '("#ffb454" "#dd8844" "brightred"    ))
   (green       '("#c2d94c" "#99bb66" "green"        ))
   (teal        '("#95e6cb" "#33CCDD" "brightgreen"  ))
   (yellow      '("#ffee99" "#EEBB88" "yellow"       ))
   (blue        '("#39bae6" "#55CCFF" "brightblue"   ))
   (dark-blue   '("#59c2ff" "#7788AA" "blue"         ))
   (magenta     '("#ff8f40" "#EE7788" "magenta"      ))
   (violet      '("#e6b673" "#BB2266" "brightmagenta"))
   (cyan        '("#f29668" "#77EEEE" "brightcyan"   ))
   (dark-cyan   '("#e6b450" "#008899" "cyan"   ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-ayu-dark-brighter-comments dark-cyan grey))
   (doc-comments   (doom-lighten (if doom-ayu-dark-brighter-comments dark-cyan grey) 0.25))
   (constants      yellow)
   (functions      orange)
   (keywords       magenta)
   (methods        orange)
   (operators      cyan)
   (type           dark-blue)
   (strings        green)
   (variables      fg)
   (numbers        dark-cyan)
   (region         base3)
   (error          "#ff3333")
   (warning        yellow)
   (success        green)
   (vc-modified    "#6994bf")
   (vc-added       "#91b362")
   (vc-deleted     "#d96c75")

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-ayu-dark-brighter-modeline)
   (-modeline-pad
    (when doom-ayu-dark-padded-modeline
      (if (integerp doom-ayu-dark-padded-modeline) doom-ayu-dark-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-ayu-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; magit-mode
   (magit-diff-hunk-heading-highlight :foreground fg :background base4 :weight 'bold)
   (magit-diff-hunk-heading :foreground fg-alt :background base3 :weight 'normal)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))

   ;; org-mode
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :background base2)
   (org-hide :foreground hidden)

   ;; tooltip and company
   (tooltip              :background bg-alt :foreground fg)
   (company-tooltip-selection     :background base3)

   ;; Ivy
   (ivy-minibuffer-match-face-2 :foreground blue :weight 'bold)

   ;; js2-mode
   (js2-object-property :foreground dark-blue)
   (js2-object-property-access :foreground dark-cyan)

   ;; rjsx-mode
   (rjsx-tag :foreground dark-cyan)
   (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)

   ;; helm
   (helm-selection :foreground bg :background blue)
   (helm-ff-file-extension :foreground magenta)
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-ayu-dark-theme.el ends here
