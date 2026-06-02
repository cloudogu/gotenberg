# keep variables beyond the single build stages, see https://stackoverflow.com/a/53682110/12529534

FROM registry.cloudogu.com/official/base:3.23.4-2 AS doguctlbinary

FROM gotenberg/gotenberg:8.33.0-libreoffice

USER root

RUN echo "deb http://deb.debian.org/debian trixie contrib non-free" > /etc/apt/sources.list.d/contrib.list \
 && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
         ca-certificates \
         wget \
         ttf-mscorefonts-installer


# hadolint ignore=DL3005
RUN apt-get -y dist-upgrade \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && mkdir -p /var/ces \
 && chown -R gotenberg:gotenberg /var/ces
USER gotenberg

# hadolint ignore=DL3048
LABEL NAME="official/gotenberg" \
      VERSION="8.33.0-0" \
      maintainer="SCM Team <scm-team@cloudogu.com>"

COPY resources /

# unpack and install doguctl
COPY --from=doguctlbinary /usr/local/bin/doguctl /usr/local/bin/

EXPOSE 3000

HEALTHCHECK CMD doguctl healthy gotenberg || exit 1

CMD ["/startup.sh"]
