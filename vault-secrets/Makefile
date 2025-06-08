default:
	git pull
	terraform init
	terraform plan	-var token=$(token)
	terraform apply -auto-approve -var token=$(token)