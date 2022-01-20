# `copybuffer` plugin

<<<<<<< HEAD
This plugin adds the <kbd>ctrl-o</kbd> keyboard shortcut to copy the current text
in the command line to the system clipboard.
=======
This plugin binds the ctrl-o keyboard shortcut to a command that copies the text
that is currently typed in the command line ($BUFFER) to the system clipboard.
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)

This is useful if you type a command - and before you hit enter to execute it - want
to copy it maybe so you can paste it into a script, gist or whatnot.

```zsh
plugins=(... copybuffer)
```
