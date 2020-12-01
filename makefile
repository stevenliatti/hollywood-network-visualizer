up:
	docker-compose up --build -d

down:
	docker-compose down

init: data/neo4j
	mkdir -p data/redis

init-with-cache: data/neo4j data/redis

data/neo4j: data/neo4j.tar.xz
	tar xfv $^ -C data

data/neo4j.tar.xz:
	mkdir -p data
	-wget -nc -O $@ https://drive.switch.ch/index.php/s/Q32bd1eZm9vQv6q/download

data/redis: data/redis.tar.xz
	tar xfv $^ -C data

data/redis.tar.xz:
	mkdir -p data
	-wget -nc -O $@ https://drive.switch.ch/index.php/s/PdjrKSxTvTevrfX/download

clean:
	$(MAKE) -C backend clean
	$(MAKE) -C tmdb-collector clean
	$(MAKE) -C tmdb-to-neo4j clean

rm-data:
	rm -rf data
