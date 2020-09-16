# pull_repo

This Dockerfile is meant to help regularly pull a Git repo's contents into a shared volume, so that your other containers can rely on the code they're using being up to date.

## Example docker-compose.yml
```
version: '3.7'
services:
    main:
        image: ubuntu
        volumes:
            - repo:/where/the/repo/contents/should/go

    puller:
        image: pull_repo
        environment:
          REPO_URL: git@github.com:MY_REPO.git
          GIT_SSH_KEY: |-
            -----BEGIN OPENSSH PRIVATE KEY-----
            YOUR SSH KEY GOES HERE,
            LEAVE BLANK IF YOUR REPO IS PUBLIC
            -----END OPENSSH PRIVATE KEY-----
        volumes:
            - repo:/repo

volumes:
  repo:
```
