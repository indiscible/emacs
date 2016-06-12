(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.milkbox.net/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(dolist (package '(helm magit))
  (unless (package-installed-p package)
    (package-install package)))


