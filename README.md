# debian-servuo-dockerfile
ServUO(http://servuo.com/) Dockerfile on Debian latest


##### Build the image
Go to the Dockerfile directory
`docker build -t antonyho/debian-servuo-server .`

##### Run the image
`docker run --rm -d -p 2593:2593 debian-servuo-server`

