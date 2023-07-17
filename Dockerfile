# keep variables beyond the single build stages, see https://stackoverflow.com/a/53682110/12529534
ARG doguctl_version=0.7.0

FROM alpine:3.17.3 as doguctlBinaryVerifier
ARG doguctl_version

ENV DOGUCTL_SHA256=4c38d308c2fe3f8eb2b44c075af7038c2d0dc1c4a5dfcd5d75393de2d1f06c0c
ENV DOGUCTL_VERSION=$doguctl_version
RUN mkdir packages
COPY packages/doguctl-$DOGUCTL_VERSION.tar.gz /packages
RUN sha256sum "/packages/doguctl-${DOGUCTL_VERSION}.tar.gz"
RUN set +x && echo "4c38d308c2fe3f8eb2b44c075af7038c2"

FROM gotenberg/gotenberg:7.8.3

USER root
RUN apt-get -y update && apt-get -y dist-upgrade && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER gotenberg

ARG doguctl_version
ENV DOGUCTL_VERSION=$doguctl_version

LABEL NAME="official/gotenberg" \
      VERSION="7.8.3-1" \
      maintainer="SCM Team <scm-team@cloudogu.com>"

COPY resources /

# unpack and install doguctl
ADD packages/doguctl-${DOGUCTL_VERSION}.tar.gz /usr/bin/

EXPOSE 3000

HEALTHCHECK CMD doguctl healthy gotenberg || exit 1

CMD ["/startup.sh"]
