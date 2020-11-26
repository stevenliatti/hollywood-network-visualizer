up:
	docker-compose up --build -d

down:
	docker-compose down

neo4j: data/neo4j.tar.xz
	tar xfv $^

data/neo4j.tar.xz:
	mkdir -p data
	-wget -nc -O $@ https://drive.switch.ch/index.php/s/Q32bd1eZm9vQv6q/download

clean:
	$(MAKE) -C backend clean
	$(MAKE) -C tmdb-collector clean
	$(MAKE) -C tmdb-to-neo4j clean

