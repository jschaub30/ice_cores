
help :
	@echo "---------------------------------------------------"
	@echo "Look in README.md for general information          "
	@echo "---------------------------------------------------"
	@echo "build       ... build docker image                 "
	@echo "up          ... run docker image (detached)        "
	@echo "term        ... run docker image (interactive)     "
	@echo "down        ... stop docker image                  "
	@echo "------ testing ------------------------------------"
	@echo "test        ... test REST service                  "
	@echo
	@echo "------ utilities ----------------------------------"
	@echo "help	       ... print this message                 "
	@echo "---------------------------------------------------"

build:
	docker build -t ice-cores .

term: down build
	docker run --rm -it -p 5001:5000 --name ice-cores ice-cores

serve: down build
	docker run --rm -d -p 5001:5000 --name ice-cores ice-cores
	echo "Ready at http://localhost:5001"

down:
	-docker stop -t1 ice-cores

test: up
	sleep 1 && \
		curl http://localhost:5001
deploy:
	cp -r web /var/www/jeremyschaub.us/demos/ice-cores/
	cp -r web /var/www/jeremyschaub.us/staging/demos/ice-cores/
