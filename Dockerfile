FROM debian:latest

RUN apt-get update
RUN apt-get install -y build-essential mono-complete git
RUN git clone https://github.com/ServUO/ServUO.git
WORKDIR /ServUO
RUN make

