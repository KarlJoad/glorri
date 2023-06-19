# Glorri

Like [Lorri](https://github.com/nix-community/lorri), but with Guile for Guix.
Main parts:
  1. Registers a root for the project, so your project's files are not accidentally GC'd.
  2. Watches either `guix.scm`, `shell.scm`, or `manifest.scm` to rebuild the environment as-needed.

# Building Documentation
```sh
./bootstrap && ./configure && make info
```
