.PHONY: sync apply_local apply_remote

THIS_FILE := $(lastword $(MAKEFILE_LIST))

message = 'Add new configuration changes'

sync:
	# Get latest changes in master
	git checkout master
	git pull

	# Create temporary branch
	if git show-ref --quiet refs/heads/temporary; then git branch -d temporary; fi
	git checkout -b temporary

	# Apply local changes to temporary branch
	python update_repository.py
	git add configurations
	git commit -am $(message)

	# Merge temporary branch into master
	git checkout master
	git merge temporary
	git branch -d temporary

apply_local:
	@$(MAKE) -f $(THIS_FILE) sync
	git push

apply_remote:
	message = "Apply remote files to local repository temporarily"
	@$(MAKE) -f $(THIS_FILE) sync
	cd configurations
	cp -af . ~
