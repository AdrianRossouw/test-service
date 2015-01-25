SHA = $(shell git rev-parse --short HEAD)
DOCKERNAME = demo:$(SHA)
SERVICE = demo

.PHONY: clean build push logs deploy

all: build push deploy

build:
	docker build -t $(DOCKERNAME) .

push:
	echo empty

deploy:
	echo empty

run:
	docker run -d -e SERVICE_URL=http://docker:3001 -p 3001:3001 $(DOCKERNAME) > .pidfile

kill:
	docker kill `cat .pidfile`

logs:
	docker logs `cat .pidfile`
