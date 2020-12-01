# Hollywood Network Visualizer

Graph visualization of TMDb data, backed by Neo4j database.

To get this project with all submodules :

```bash
git clone https://github.com/stevenliatti/hollywood-network-visualizer.git --recurse-submodules
```

## Running the system

### Dependencies
Developed and tested on Linux, your system need at minimum :

- tar
- wget
- docker
- docker-compose

To execute `tmdb-to-neo4j`, you have to setup Scala and sbt. To execute `tmdb-collector`, you have to setup Rust. See doc in each submodules.

### Deployment
Define a `.env` file in `frontend` directory to set `API_BASE_URL`. If you try in local, here the content :

```
API_BASE_URL=http://localhost/api
```

Run without cache :

```bash
make init
make up
```

Run with some existent cache :

```bash
make init-witch-cache
make up
```

