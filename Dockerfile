FROM gotenberg/gotenberg:7.1.0

LABEL NAME="official/gotenberg" \
      VERSION="7.1.0-1" \
      maintainer="Sebastian Sdorra <sebastian.sdorra@cloudogu.com>"

HEALTHCHECK CMD doguctl healthy gotenberg || exit 1

EXPOSE 3000