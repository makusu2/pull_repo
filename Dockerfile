FROM alpine:3

LABEL version="0.0"

RUN apk add git openssh-client && mkdir ~/.ssh

COPY ./pull_repo ./pull_repo

RUN chmod u+x ./pull_repo

ENV SLEEP_DELAY=60 REPO_NAME=. TARGET_DIR=/repo GIT_BRANCH=master

CMD /bin/sh ./pull_repo
