FROM debian:latest

RUN apt-get update
RUN apt-get install -y mono-complete git
RUN git clone https://github.com/ServUO/ServUO.git
RUN make

