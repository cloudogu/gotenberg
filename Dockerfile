# keep variables beyond the single build stages, see https://stackoverflow.com/a/53682110/12529534

FROM registry.cloudogu.com/official/base:3.21.0-1 as doguctlBinary

FROM gotenberg/gotenberg:8.20.1

USER root
# hadolint ignore=DL3005
RUN apt-get -y update && apt-get -y dist-upgrade && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER gotenberg

# hadolint ignore=DL3048
LABEL NAME="official/gotenberg" \
      VERSION="8.18.0-2" \
      maintainer="SCM Team <scm-team@cloudogu.com>"

COPY resources /

# unpack and install doguctl
COPY --from=doguctlBinary /usr/bin/doguctl /usr/bin/

EXPOSE 3000

HEALTHCHECK CMD doguctl healthy gotenberg || exit 1

CMD ["/startup.sh"]
