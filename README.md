#### LeafLink Take Home ####


# Git Repo (assumes you have GIT installed locally)
git clone https://github.com/ny3r/leaf_takehome.git

# DockerHub Repo:
https://hub.docker.com/r/rommul92/ll_takehome

# Docker pull command (Assumes you have Docker installed locally)
docker pull rommul92/ll_takehome

# Steps to run locally via Docker Pull Command
1. docker pull rommul92/ll_takehome
    Should see below output:
    Status: Downloaded newer image for rommul92/ll_takehome:latest
    docker.io/rommul92/ll_takehome:latest

2. docker run -e SECURE_WEATHER_API_KEY={api_key} -d --name {container name of your preference} rommul92/ll_takehome:latest
   (You can also run it in attached mode by removing -d flag but would need to open up a new terminal to run remaining command)

3. docker exec -t {same container name as above} curl http://localhost:80/weather
   Should see something like this:
   {
    "city": "New York City",
    "description": "Clear",
    "humidity": 60.795284486152,
    "pressure": 101630,
    "temperature": "68.00\u00b0F"
   }


# Steps to run locally with Git repo files or Tar'd files

1. git clone https://github.com/ny3r/leaf_takehome.git  OR unzip file provided

2. docker build -t {image name of your choosing} .

3. docker run -e SECURE_WEATHER_API_KEY={api_key} -d --name {container name of your preference} {image name chosen last step}
   (You can also run it in attached mode by removing -d flag but would need to open up a new terminal to run remaining command)

4. docker exec -t {same container name as above} curl http://localhost:80/weather
   Should see something like this:
   {
    "city": "New York City",
    "description": "Clear",
    "humidity": 60.795284486152,
    "pressure": 101630,
    "temperature": "68.00\u00b0F"
   }





