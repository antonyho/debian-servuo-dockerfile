# debian-servuo-dockerfile

[ServUO](http://servuo.com/) Dockerfile
Stack:
- Debian 11
- .NET 7.0
- Mono


## You may use this resource in 2 ways

### Docker Image Route

#### Building the image

##### Clone this project

```
git clone https://github.com/antonyho/debian-servuo-dockerfile.git
```

##### Build the image

Go to the Dockerfile directory

```
docker build --rm -t antonyho/debian-servuo-server .
```


#### Starting the container

##### Run the image

```
docker run --rm -d -p 2593:2593 antonyho/debian-servuo-server
```


### Docker Compose Route

#### Prepare the data files and configurations

Before you start:

- Download UO client and copy the game client data to the "gamedata" directory, or get some idea from [ServUO resoureces](https://www.servuo.com/archive/ultima-online-various-editions.1496/)
- Take the config from [ServUO project](https://github.com/ServUO/ServUO/tree/master/Config) and put only your custom config files into the "configs" directory
- Put your custom scripts to the "scripts" directory


#### Building the suite

You don't really need this step. But you can pre-build the image and just launch the image directly.

```
docker-compose build
```


#### Starting the suite

On the first launch, I suggest to set these ENVVARS on the host, to initialise owner account.

```
export OWNER_USERNAME=adminAccount
export OWNER_PASSWORD=AComplicatedAdminPassword
```

You don't need to set the ENVVARS after the first run, because the owner account is created. 
Remember the account credential which you set here!

Then execute the follow command to launch the suite

```
docker-compose up -d
```

After the shard is launched, you may unset the owner credential from ENVVARS for safety reason.

```
unset OWNER_USERNAME
unset OWNER_PASSWORD
```


#### Stopping the suite

If you just want to stop the services

```
docker-compose down
```


#### Cleaning up the Docker images

If you don't want the Docker images and volumes, 
you may remove them.

```
docker-compose down --rmi all --remove-orphans --volumes
```


### Notes

I do not use [Docker Compose Configs](https://docs.docker.com/compose/compose-file/08-configs/), 
because [Volumes](https://docs.docker.com/compose/compose-file/07-volumes/) is more convenient 
in this use case.

I can overwrite the config files to the shard when they are present. 
Instead of mounting the directory, that forces the shard owner to add 
all config files even with default values.

I mount the local directory to the shard's "Saves" directory for easier access 
and backup. You may change that Docker volume if you want to do it 
in a differeny way.


## TODO

- [X] Use docker-compose
- [X] Mounting data files volume
- [X] Mounting config files volume
- [X] Optionally mounting script files volume
