FROM openjdk:8u171-jdk-alpine3.8

RUN apk --no-cache add curl unzip \
  && wget -O modpack.zip https://media.forgecdn.net/files/3570/46/SevTech_Ages_Server_3.2.3.zip \
  && unzip modpack.zip -d /minecraft \
  && cd /minecraft \
  && chmod +x Install.sh ServerStart.sh \
  && ./Install.sh \
  && echo "eula=true" > eula.txt \
  && mkdir serverconfig \
  && mv settings.sh serverconfig/ \
  && { for f in server.properties whitelist.json ops.json banned-ips.json banned-players.json settings.sh; do ln -s "serverconfig/$f"; done; } \
  && mkdir state \
  && { for f in usercache.json usernamecache.json; do ln -s "state/$f"; done; }

FROM openjdk:8u171-jdk-alpine3.8

COPY --from=0 /minecraft /minecraft

VOLUME /minecraft/world /minecraft/logs /minecraft/serverconfig /minecraft/state /minecraft/backups

EXPOSE 25565

WORKDIR /minecraft

CMD ./ServerStart.sh
