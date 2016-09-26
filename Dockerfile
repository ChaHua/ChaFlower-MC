FROM nimmis/java:openjdk-8-jdk

MAINTAINER nimmis <kjell.havneskold@gmail.com>

#default directory for SPIGOT-server
ENV SPIGOT_HOME /minecraft

#default version 
ENV SPIGOT_VER latest
ENV EULA true

# add extra files needed
COPY rootfs /

# add some needed commands 
RUN apt-get update && apt-get install -y wget && apt-get clean all

# Make special user for minecraft to run in

RUN useradd -s /bin/bash -d /minecraft -m minecraft

# Build latest spigotmc
WORKDIR /root
wget -O spigot.jar http://tcpr.ca/files/spigot/spigot-latest.jar

# Set the timezone.
RUN sudo echo "Asia/Shanghai" > /etc/timezone
RUN sudo dpkg-reconfigure -f noninteractive tzdata

# expose minecraft port
EXPOSE 25565



