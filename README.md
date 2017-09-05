# configurations

A collection of configuration files for various programs I use.

You can fork this repository and use it as manager for _your own_ configuration files, should you so wish.

Just empty the `configurations` folder and modify the `files_to_save` file with whatever you want to synchronise.

## Makefile targets

### apply_local


Use this when you want to save some changes you've made locally.

#### What it does:

* Copies all local configuration files into the repository.
* Syncs them with the latest configuration files from the server.
* Pushes the new changes to the server.

#### Usage:

```
make apply_local
```

An optional commit message can be specified, for example:

```
make apply_local m="Modify bashrc contents"
```

#### Notes:

* If your local changes conflict with any new ones from upstream, you
  can resolve the conflicts with git.


### apply_remote


Use this to fetch the latest changes from the internet.

```
make apply_remote
```

#### What it does:
* Fetches latest changes from server.
* Syncs them with any local changes.
* Copies the latest files to your local machine.


### update_tools


Use this to obtain updates to the repository without
overwriting or updating any local changes.

```
make update_tools
```


### clean_local


Use this to overwrite any local changes with the contents
of the repository. This will not fetch any new changes
from the server.

```
make clean_local
```

#### What it does:
* Overwrites local configurations with those from repository.
