# debian-servuo-dockerfile

[ServUO](http://servuo.com/) Dockerfile
Stack:
- Debian 11
- .NET 7.0
- Mono

##### Clone this project

`git clone https://github.com/antonyho/debian-servuo-dockerfile.git`

##### Build the image

Go to the Dockerfile directory

`docker build --rm -t antonyho/debian-servuo-server .`

##### Run the image

`docker run --rm -d -p 2593:2593 antonyho/debian-servuo-server`


## TODO

- [ ] Use docker-compose
- [ ] Mounting data files volume
- [ ] Mounting config files volume
- [ ] Optionally mounting script files volume
