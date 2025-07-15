# keep variables beyond the single build stages, see https://stackoverflow.com/a/53682110/12529534

FROM registry.cloudogu.com/official/base:3.22.0-3 AS doguctlbinary

FROM gotenberg/gotenberg:8.21.1

USER root
# hadolint ignore=DL3005
RUN apt-get -y update && apt-get -y dist-upgrade && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/ces && \
    chown -R gotenberg:gotenberg /var/ces
USER gotenberg

# hadolint ignore=DL3048
LABEL NAME="official/gotenberg" \
      VERSION="8.21.1-2" \
      maintainer="SCM Team <scm-team@cloudogu.com>"

COPY resources /

# unpack and install doguctl
COPY --from=doguctlbinary /usr/local/bin/doguctl /usr/local/bin/

EXPOSE 3000

HEALTHCHECK CMD doguctl healthy gotenberg || exit 1

CMD ["/startup.sh"]
