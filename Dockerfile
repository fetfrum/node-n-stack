FROM node:16-buster-slim 

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sSL https://get.haskellstack.org/ | sh

RUN cd ~ && \
    stack --resolver ghc-8.10.4 new tmp && \
    cd tmp && \
    stack build && \
    cd .. && \
    rm -fR tmp && \
    cd /

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "node" ]