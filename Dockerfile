FROM debian:stable
RUN mkdir /data
VOLUME /data/
RUN apt-get update \
 && apt-get install -y wget
RUN wget http://www.mixmod.org/IMG/deb/mixmodGUI_1-2-1_x86_64-applications.deb -O mixmodGUI.deb
RUN wget sudo dpkg -i mixmodGUI.deb
RUN wget http://www.mixmod.org/IMG/deb/libmixmod_3.2.0-gcc5.2.1-runtime.deb -O libmixmod.deb
RUN wget sudo dpkg -i libmixmod.deb
