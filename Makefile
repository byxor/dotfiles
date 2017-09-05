.PHONY: sync apply_local apply_remote clean_local


THIS_FILE := $(lastword $(MAKEFILE_LIST))

MASTER_BRANCH = 'master'
TEMPORARY_BRANCH = 'temporary'

m = Miscellaneous commit
COMMIT_MESSAGE = '$m'


apply_local:
#
# Use this when you want to save some changes you've made locally.
#
# ### What it does:
# 
# * Copies all local configuration files into the repository.
# * Syncs them with the latest configuration files from the server.
# * Pushes the new changes to the server.
#
# ### Usage:
#
# ```
# make {{target}}
# ```
#
# An optional commit message can be specified, for example:
#
# ```
# make {{target}} m="Modify bashrc contents"
# ```
#
# ### Notes:
#
# * If your local changes conflict with any new ones from upstream, you
#   can resolve the conflicts with git.
#
	@$(MAKE) -f $(THIS_FILE) __sync
	git push

apply_remote:
	@$(MAKE) -f $(THIS_FILE) __sync
	@$(MAKE) -f $(THIS_FILE) __overwrite_local_configurations

update_tools:
	git pull

clean_local:
	@$(MAKE) -f $(THIS_FILE) __overwrite_local_configurations

__sync:
	# Get latest changes from origin
	git checkout $(MASTER_BRANCH)
	git pull

	# Create temporary branch
	if git show-ref --quiet refs/heads/$(TEMPORARY_BRANCH); then git branch -d $(TEMPORARY_BRANCH); fi
	git checkout -b $(TEMPORARY_BRANCH)

	# Apply local changes to temporary branch
	python update_repository.py
	git add configurations
	git commit -am $(COMMIT_MESSAGE)

	# Merge temporary branch into main branch
	git checkout $(MASTER_BRANCH)
	git merge $(TEMPORARY_BRANCH)
	git branch -d $(TEMPORARY_BRANCH)

__overwrite_local_configurations:
	cd configurations; cp -af . ~
