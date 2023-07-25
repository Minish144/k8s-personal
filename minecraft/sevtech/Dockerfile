FROM openjdk:8u171-jdk-alpine3.8

RUN apk --no-cache add curl unzip

RUN curl --silent --fail --show-error --location https://minecraft.curseforge.com/projects/sevtech-ages/files/3570046/download --output modpack.zip
RUN unzip modpack.zip -d /minecraft
RUN cd /minecraft
RUN chmod +x Install.sh ServerStart.sh
RUN ./Install.sh
RUN echo "eula=true" > eula.txt
RUN mkdir serverconfig
RUN mv server.properties serverconfig/
RUN { for f in server.properties whitelist.json ops.json banned-ips.json banned-players.json; do ln -s "serverconfig/$f"; done; }
RUN mkdir state
RUN { for f in usercache.json usernamecache.json; do ln -s "state/$f"; done; }

FROM openjdk:8u171-jdk-alpine3.8

COPY --from=0 /minecraft /minecraft

VOLUME /minecraft/world /minecraft/logs /minecraft/serverconfig /minecraft/state /minecraft/backups

EXPOSE 25565

WORKDIR /minecraft

CMD ./ServerStart.sh
