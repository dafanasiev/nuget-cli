all: oci-image

NUGET_VERSION=$(shell grep 'ARG\sNUGET_VERSION=' Dockerfile | awk '{split($$2,a,"="); print a[2]}')

oci-image:
	docker buildx build -t dafanasiev/nuget-cli:$(NUGET_VERSION) .

oci-image-push:
	docker buildx build --push -t dafanasiev/nuget-cli:$(NUGET_VERSION) .
