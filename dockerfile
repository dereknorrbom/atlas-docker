FROM debian:stretch-slim

MAINTAINER Derek Norrbom

# Server Name
ENV SESSIONNAME "Atlas Docker"
# Map name
ENV SERVERMAP "Ocean"
# UID of the user steam
ENV UID 1000
# GID of the user steam
ENV GID 1000
# Server password
#ENV SERVERPASSWORD "123"
# Admin password
#ENV ADMINPASSWORD "123"
# Server PORT
#ENV SERVERPORT 27015
# Steam port
#ENV STEAMPORT 7778

# Install dependencies
RUN apt-get update && apt-get install -y software-properties-common curl lib32gcc1 lsof
# Add non-free repo to install steamcmd
RUN add-apt-repository non-free
# Use debconf to answer the license command prompt automagically
RUN echo steamcmd steam/question select "I AGREE" | debconf-set-selections
# The i386 arch is needed to install steamcmd properly
RUN dpkg --add-architecture i386; apt-get update; \
apt-get install -y steamcmd
# Add steamcmd to path
ENV PATH=$PATH:/usr/games

COPY install-server.sh .

# Run commands as the steam user
RUN adduser \
	--disabled-login \
	--shell /bin/bash \
	--gecos "" \
	-u "$UID" steam

# switch to steam user
USER steam
#RUN steamcmd +quit; rm -rf /root/.steam/logs/* /var/lib/apt/lists/* /tmp/*

# Install Atlas server files.  THIS WILL TAKE A WHILE
RUN /install-server.sh
