FROM ubuntu:18.04 as base

# update the packages and install wget
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget
# copy & install azcopy binary | delete the downlaoded archive
RUN wget -O azcopyv10.tar https://azcopyvnext.azureedge.net/release20190703/azcopy_linux_amd64_10.2.1.tar.gz --no-check-certificate \
    && tar -xf azcopyv10.tar --strip-components=1 --wildcards azcopy_linux_*/azcopy
FROM ubuntu:18.04 

RUN useradd -U -m -d /home/azcopy azcopy

COPY --from=base --chown=azcopy:azcopy /azcopy /bin/azcopy

USER azcopy

WORKDIR /home/azcopy