FROM ubuntu:20.04
WORKDIR /pysection
COPY . /pysection
ENV TZ=Europe/Zagreb
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y software-properties-common vim binutils git python3-pip && pip3 install uncompyle6 bandit && add-apt-repository ppa:deadsnakes/ppa && apt update 
RUN git clone https://github.com/extremecoders-re/pyinstxtractor && git clone https://github.com/countercept/python-exe-unpacker
ENTRYPOINT ["/bin/bash"]
