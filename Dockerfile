FROM ubuntu:latest
FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-dev \
    build-essential \
    git \
&& pip3 install --no-cache-dir PyYAML \
&& apt-get purge -y build-essential python3-dev \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/*

#RUN pip3 install --no-cache-dir -i https://pypi.org/simple PyYAML
#RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]