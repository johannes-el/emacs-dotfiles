# emacs-dotfiles
Configuration files for vanilla emacs.

## Files Overview

- **config.el**: Core Emacs configuration.
- **config.org**: Org-mode version of the configuration, used for easier management and tangling into `config.el`.
- **custom.el**: Auto-generated custom settings file, storing changes made via Emacs' built-in customization UI.
- **init.el**: Entry point for loading the configuration and custom files.
- **LICENSE**: Project is licensed under the GPL-3.0.

## Setup

To use this configuration:
Clone the repository and move the contents of the folder inside `~/.emacs.d`.
It should work out of the box, provided clangd, rust-analyzer and similar packages are installed.

## License

This project is licensed under the **GPL-3.0**. See the [LICENSE](./LICENSE) file for details.
