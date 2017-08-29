.PHONY: apply_local apply_remote

message = 'Add new configuration changes'

apply_local:
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

	# Push master to origin
	git push

apply_remote:
	# Get latest changes in master
	git checkout master
	git pull

	# Create temporary branch
	if git show-ref --quiet refs/heads/temporary; then git branch -d temporary; fi
	git checkout -b temporary

	# Apply local changes to temporary branch
	python update_repository.py
	git add configurations
	git commit -am "Apply remote files to local repository temporarily"

	# Merge temporary branch into master
	git checkout master
	git merge temporary
	git branch -d temporary

	# Copy the files to local machine
	cd configurations
	cp -af . ~
