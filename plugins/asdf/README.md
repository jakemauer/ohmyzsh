## asdf

**Maintainer:** [@RobLoach](https://github.com/RobLoach)

Adds integration with [asdf](https://github.com/asdf-vm/asdf), the extendable version manager, with support for Ruby, Node.js, Elixir, Erlang and more.

### Installation

<<<<<<< HEAD
1. [Download asdf](https://asdf-vm.com/guide/getting-started.html#_2-download-asdf) by running the following:

  ```
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  ```

2. [Enable asdf](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf) by adding it to your `plugins` definition in `~/.zshrc`.
=======
1. Enable the plugin by adding it to your `plugins` definition in `~/.zshrc`.
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)

  ```
  plugins=(asdf)
  ```

<<<<<<< HEAD
### Usage

See the [asdf documentation](https://asdf-vm.com/guide/getting-started.html#_4-install-a-plugin) for information on how to use asdf:

```
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
asdf local nodejs latest
=======
2. [Install asdf](https://github.com/asdf-vm/asdf#setup) by running the following:
  ```
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  ```

### Usage

See the [asdf usage documentation](https://github.com/asdf-vm/asdf#usage) for information on how to use asdf:

```
asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git
asdf install nodejs 5.9.1
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
```
