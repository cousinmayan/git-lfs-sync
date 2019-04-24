FROM debian:9.5-slim

LABEL "com.github.actions.name"="Git LFS Sync"
LABEL "com.github.actions.description"="Fetch and checkout LFS items."
LABEL "com.github.actions.icon"="download-cloud"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/cousinmayan/git-lfs-sync"
LABEL "homepage"="https://github.com/cousinmayan"

RUN build_deps="curl" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ${build_deps} ca-certificates git && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git-lfs && \
    git lfs install && \
    DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove ${build_deps} && \
    rm -r /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
