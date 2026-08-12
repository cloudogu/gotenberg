FROM registry.cloudogu.com/official/base:3.24.1-2 AS doguctlbinary

FROM gotenberg/gotenberg:8.34.0-libreoffice

USER root

RUN mkdir -p /var/ces && chown -R gotenberg:gotenberg /var/ces

# hadolint ignore=DL3005
RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER gotenberg

# hadolint ignore=DL3048
LABEL NAME="official/gotenberg" \
      VERSION="8.34.0-1" \
      maintainer="SCM Team <scm-team@cloudogu.com>"

COPY resources /

COPY --from=doguctlbinary /usr/local/bin/doguctl /usr/local/bin/

EXPOSE 3000

HEALTHCHECK CMD doguctl healthy gotenberg || exit 1

CMD ["/startup.sh"]
