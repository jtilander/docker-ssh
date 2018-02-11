IMAGENAME=jtilander/docker-ssh
TAG?=test

image:
	@docker build -t $(IMAGENAME):$(TAG) .
	@docker images $(IMAGENAME):$(TAG)

run:
	docker run -p 2222:22 --rm $(IMAGENAME):$(TAG)
