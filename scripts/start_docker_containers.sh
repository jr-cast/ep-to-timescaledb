POSTGRES_PASSWORD=multipass
JUPYTER_TOKEN=multipass

docker network create EPtimeseries-demo
# starts timescale database on localhost
docker run -d --net EPtimeseries-demo --name timescaledb -p 127.0.0.1:5432:5432 -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD timescale/timescaledb:latest-pg12

docker run -d --net EPtimeseries-demo --name jupyterlab -p 8080:8080 -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan jupyter/datascience-notebook start-notebook.sh --NotebookApp.token=$JUPYTER_TOKEN
