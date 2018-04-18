
/etc/nginx/sites-enabled/axelbrooke-local.conf:
	sudo ln -s $(shell pwd)/axelbrooke-local.conf /etc/nginx/sites-enabled/axelbrooke-local.conf

.PHONY: deploy
deploy:
	gcloud config set account stuart@axelbrooke.com
	gcloud config set project axlebrooke-com
	gsutil cp index.html gs://www.axelbrooke.com/index.html
	gsutil acl ch -u AllUsers:R gs://www.axelbrooke.com/index.html

