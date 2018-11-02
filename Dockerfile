FROM ubuntu:latest
LABEL heming "hemings1@uci.edu"
ENV REFRESHED_AT 2018-10-23

# get dependencies
RUN apt-get update
RUN apt-get install -y build-essential git-core m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev swig python-dev python
RUN apt-get clean

# checkout repo with mercurial
WORKDIR /usr/local/src
RUN git clone https://github.com/gem5/gem5.git
# build it
WORKDIR /usr/local/src/gem5
ADD build.bash /usr/local/src/gem5/build.bash
RUN chmod ugo+x build.bash
RUN ./build.bash
ENTRYPOINT bash
