# Demo vlang

Trying to learn [vlang](https://vlang.io) with the special focus on scripting functionality.

## Usage

```bash
make script
make cli
```

## Emacs

- [v-mode](https://github.com/damon-kwok/v-mode)

### Spacemacs

Example snippet to integrate `v-mode` into [Spacemacs](https://www.spacemacs.org).

```lisp
;; tools/package.el
(defconst tools-packages
  '(
    v-mode
    )
  )
  
;; V lang
;; https://github.com/damon-kwok/v-mode
(defun tools/init-v-mode()
  (use-package v-mode
    :config
    :bind-keymap
    ("M-m a t v" . v-mode-menu)
    ;;("C-c C-f" . v-format-buffer)
    :mode ("\\.v?v\\.vsh\\'" . 'v-mode))
  )
```

## References

- [V Documentation](https://github.com/vlang/v/blob/master/doc/docs.md)
- [V File Templates](https://github.com/vlang/v/blob/master/doc/docs.md#tmpl-for-embedding-and-parsing-v-template-files)
