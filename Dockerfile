FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y libqt4-xmlpatterns libqt4-xml libqtgui4
RUN apt-get install -y libqwt6
RUN apt-get install -y sudo

RUN cd /opt
RUN wget http://www.mixmod.org/IMG/deb/mixmodGUI_1-2-1_x86_64-applications.deb
RUN dpkg -i ./mixmodGUI_1-2-1_x86_64-applications.deb
RUN apt-get install -y -f

ARG UID
ARG GID
RUN mkdir -p /home/mixmoduser && \
    echo "mixmoduser:x:${UID}:${GID}:Mixmod User,,,:/home/mixmoduser:/bin/bash" >> /etc/passwd && \
    echo "mixmoduser:x:${UID}:" >> /etc/group && \
    echo "mixmoduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/mixmoduser && \
    chmod 0440 /etc/sudoers.d/mixmoduser && \
    chown ${UID}:${GID} -R /home/mixmoduser

USER mixmoduser
ENV HOME /home/mixmoduser

CMD [ '/usr/bin/mixmodGUI' ]
