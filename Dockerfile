FROM docker-unturned:steamcmd

ARG APP_ID=1110390

ARG ROCKET_VERSION=4.9.3.3

RUN echo "@ShutdownOnFailedCommand 1\nlogin anonymous\nforce_install_dir \"/home/steam/app\"\napp_update ${APP_ID}\nquit" > ./steamcmd-query && \
    ./steamcmd.sh +runscript ./steamcmd-query

# Do not separate download and unpack of rocket core to
# avoid any possible version mismatch on install
RUN wget -O /home/steam/Legally-Distinct-Missile.Rocket.Unturned.zip \
        "https://github.com/SmartlyDressedGames/Legally-Distinct-Missile/releases/download/v${ROCKET_VERSION}/Rocket.Unturned.zip" && \
    unzip -j /home/steam/Legally-Distinct-Missile.Rocket.Unturned.zip -d /home/steam/app/Modules/

WORKDIR /home/steam/app

EXPOSE 27015 27016

CMD ["./Unturned_Headless.x86_64", "-batchmode", "-nographics", "+secureserver/Default"]
