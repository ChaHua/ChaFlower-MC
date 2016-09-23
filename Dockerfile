FROM nimmis/java:openjdk-8-jdk

MAINTAINER nimmis <kjell.havneskold@gmail.com>

#default directory for SPIGOT-server
ENV SPIGOT_HOME /minecraft

#default version 
ENV SPIGOT_VER 1.10.0
ENV EULA true

# add extra files needed
COPY rootfs /

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD ./sources.list.trusty /etc/apt/sources.list

# add some needed commands 
RUN apt-get update && apt-get install -y wget git && apt-get clean all

# Make special user for minecraft to run in

RUN useradd -s /bin/bash -d /minecraft -m minecraft

# Set the timezone.
RUN sudo echo "Asia/Shanghai" > /etc/timezone
RUN sudo dpkg-reconfigure -f noninteractive tzdata

ADD ./spigot-1.10.0.jar /root/spigot.jar
RUN cp /root/spigot.jar /minecraft

# expose minecraft port
EXPOSE 25565



