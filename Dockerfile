from ubuntu:latest

RUN apt-get update -q
RUN apt-get install git build-essential libssl-dev -qqy

RUN git clone https://github.com/wg/wrk.git
WORKDIR /wrk
RUN make -j $(nproc)
RUN cp wrk /usr/local/bin
ENTRYPOINT ["wrk"]
