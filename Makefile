.PHONY: apply_local apply_remote

message = 'Add new configuration changes'

apply_local:
	python update_repository.py
	git add configurations
	git commit -am $(message)
	git push

apply_remote:
	git pull && cd configurations && cp -af . ~
