FROM debian:11 AS builder
RUN apt-get update
RUN apt-get install -y wget git
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-7.0
RUN git clone https://github.com/ServUO/ServUO.git
WORKDIR /ServUO
RUN dotnet build

FROM debian:11
RUN apt-get update
RUN apt-get install -y mono-complete
WORKDIR /ServUO
COPY --from=builder /ServUO /ServUO
CMD ["mono", "ServUO.exe"]

