FROM ubuntu:18.04 as base

# update the packages and install wget
RUN apt-get update \
    && apt-get install -y wget
# copy & install azcopy binary | delete the downlaoded archive
RUN wget -O azcopyv10.tar https://azcopyvnext.azureedge.net/release20190703/azcopy_linux_amd64_10.2.1.tar.gz \
    && tar -xf azcopyv10.tar -C /bin/ --strip-components=1 \
    && rm azcopyv10.tar
