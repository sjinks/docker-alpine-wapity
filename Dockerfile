FROM alpine:3.14.2

RUN \
    apk add --no-cache python3 py3-pip && \
    install -d /opt/wapiti && \
    cd /opt/wapiti && wget -q https://deac-fra.dl.sourceforge.net/project/wapiti/wapiti/wapiti-3.0.3/wapiti3-3.0.3.tar.gz -O - | tar -xz --strip-components=1 -f - && \
    python3 setup.py install && \
    rm -rf build && \
    install -d -o nobody -g nobody -m 0700 /.wapiti /config

USER nobody:nobody
WORKDIR /opt/wapiti
VOLUME /.wapiti
ENTRYPOINT ["/usr/bin/python3", "bin/wapiti"]
