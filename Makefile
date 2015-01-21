SHA = $(shell git rev-parse --short HEAD)
DOCKERNAME = docker:5001/demo:$(SHA)
SERVICE = demo

.PHONY: clean build push logs deploy

all: build push deploy


build:
	docker build -t $(DOCKERNAME) .

push:
	docker push $(DOCKERNAME)

deploy:
	longshoreman --app $(SERVICE)1.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)2.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)3.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)4.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)5.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)6.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)7.docker deploy $(DOCKERNAME) --count 1
	longshoreman --app $(SERVICE)8.docker deploy $(DOCKERNAME) --count 1

run:
	docker run -d -e SERVICE_URL=http://docker:3001 -p 3001:3001 $(DOCKERNAME) > .pidfile

kill:
	docker kill `cat .pidfile`

