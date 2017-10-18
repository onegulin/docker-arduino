FROM ubuntu:14.04

RUN apt-get update && apt-get install -y arduino
ADD arduino-1.8.5-linux64.tar /home/arduino

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/vlbl && \
    echo "vlbl:x:${uid}:${gid}:vlbl,,,:/home/vlbl:/bin/bash" >> /etc/passwd && \
    echo "vlbl:x:${uid}:" >> /etc/group && \
    echo "vlbl ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vlbl && \
    chmod 0440 /etc/sudoers.d/vlbl && \
    chown ${uid}:${gid} -R /home/vlbl && \
    mkdir /home/vlbl/cloud

RUN adduser vlbl dialout

RUN cd /home/arduino/arduino-1.8.5 \
    ./install.sh

USER vlbl
ENV HOME /home/vlbl
CMD /home/arduino/arduino-1.8.5/arduino
