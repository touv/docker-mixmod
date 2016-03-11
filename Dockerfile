FROM ubuntu:wily
RUN apt-get update
RUN apt-get install -y wget
RUN wget http://www.mixmod.org/IMG/deb/mixmodGUI_1-2-1_x86_64-applications.deb -O mixmodGUI.deb
RUN wget http://www.mixmod.org/IMG/deb/libmixmod_3.2.0-gcc5.2.1-runtime.deb -O libmixmod.deb
RUN apt-get install -y gcc-5-base
RUN apt-get install -y libqt4-xml libqt4-xmlpatterns libqtcore4 libqtgui4 libqwt6
RUN dpkg -i mixmodGUI.deb
RUN dpkg -i libmixmod.deb
RUN mkdir /data
VOLUME /data/
