FROM debian:buster-slim

RUN apt-get update && \
    apt-get install --yes --no-install-recommends --no-install-suggests \
        lib32stdc++6=8.3.0-6 \
        lib32gcc1=1:8.3.0-6 \
        wget=1.20.1-1.1 \
        ca-certificates=20190110 \
        unzip=6.0-23+deb10u1 && \
    rm --recursive --force /var/lib/apt/lists/*

RUN useradd --create-home --uid 1000 steam

RUN ln --symbolic /home/steam/steamcmd/linux64/steamclient.so /lib/steamclient.so && \
    ln --symbolic /home/steam/steamcmd/linux32/steamclient.so /lib32/steamclient.so
   
USER steam

WORKDIR /home/steam

RUN mkdir --parents ./steamcmd && \
    cd ./steamcmd && \
    { wget --quiet --output-document - 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' \
    | tar --verbose --extract --gzip --file -; } && \
    ./steamcmd.sh +quit

WORKDIR /home/steam/steamcmd
