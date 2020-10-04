COMPOSE_RUN_SHELL= docker-compose run --rm shell
DB_NAME=DA_Serverless
.PHONY: buildzip
buildzip:
	$(COMPOSE_RUN_SHELL) make _buildzip
_buildzip:
	mkdir terraform/lamda_zip;cd src;zip ../terraform/lamda_zip/remove_untagged_instances.zip remove_untagged_instances.py;

#.PHONY: ssmsetup
#ssmsetup:
#	$(COMPOSE_RUN_SHELL)  aws ssm put-parameter \
    --name "DB_NAME" \
    --type "String" \
    --value $(DB_NAME) \
    --overwrite
	
.PHONY: plan #Execute Terraform Plan and output the plan
plan:buildzip
	$(COMPOSE_RUN_SHELL) make _plan

.PHONY: _plan #bash command to run the plan
_plan:
	cd terraform;terraform init;terraform plan  -out serverless_07_02


.PHONY: deploy #Execute the Terraform Apply to creates the network and ECR
deploy: plan
	$(COMPOSE_RUN_SHELL) make _deploy

PHONY: _deploy #bash command to run the plan
_deploy:
	cd terraform; terraform apply serverless_07_02;


.PHONY: clean #Deletes the AWS infra created by terraform
clean:
	$(COMPOSE_RUN_SHELL) make _clean

.PHONY:_clean
_clean:
	cd terraform;terraform destroy;