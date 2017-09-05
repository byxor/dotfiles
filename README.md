# configurations

A collection of configuration files for various programs I use.

You can fork this repository and use it as manager for _your own_ configuration files, should you so wish.

Just empty the `configurations` folder and modify the `files_to_save` file with whatever you want to synchronise.

# Makefile targets

## THIS_FILE



## apply_local


Use this when you want to save some changes you've made locally.

# What it does:

* Copies all local configuration files into the repository.
* Syncs them with the latest configuration files from the server.
* Pushes the new changes to the server.

# Usage:

```
make {{target}}
```

An optional commit message can be specified, for example:

```
make {{target}} m="Modify bashrc contents"
```

# Notes:

* If your local changes conflict with any new ones from upstream, you
  can resolve the conflicts with git.


## apply_remote



## update_tools



## clean_local
