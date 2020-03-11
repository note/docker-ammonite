FROM byrnedo/alpine-curl AS builder

ARG SCALA_VERSION
ARG AMMONITE_VERSION

ENV AMM_URL https://github.com/lihaoyi/Ammonite/releases/download/$AMMONITE_VERSION/$SCALA_VERSION-$AMMONITE_VERSION

RUN (echo "#!/usr/bin/env sh" && curl -L $AMM_URL) > /root/amm

FROM adoptopenjdk/openjdk8:jre8u242-b08-alpine

RUN apk add --no-cache bash ncurses

COPY --from=builder /root/amm /usr/local/bin/amm
RUN chmod +x /usr/local/bin/amm

WORKDIR /root/

RUN amm -c ""

CMD amm
