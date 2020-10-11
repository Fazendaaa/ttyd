REPO_OWNER:=tsl0922
PROJECT:=ttyd
MULTIARCH:=false
ARCHS:=linux/amd64
VERSION:=latest
ALPINE:=false
BASE:=ubuntu
ifeq (true, $(MULTIARCH))
	ARCHS:=linux/386,linux/amd64,linux/arm/v7,linux/arm64/v8
endif
ifeq (true, $(ALPINE))
	BASE:=alpine
endif
FILE:=$(shell pwd)/Dockerfile.$(BASE)

all: setup build

setup:
	@./buildx.sh
build:
	docker buildx build $(ENV) \
	--platform $(ARCHS) \
	--file $(FILE) \
	--push --tag $(REPO_OWNER)/$(PROJECT):$(VERSION)-$(BASE) .
