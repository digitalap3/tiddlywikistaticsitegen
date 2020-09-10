From debian:buster-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install \
    vim curl locales less procps ca-certificates rsync
   
## CHANGE PASSWORD
RUN useradd -m -s /bin/bash nodeuser && \
    echo 'nodeuser:password' | chpasswd && \
    usermod -u 101 nodeuser && \
    groupmod -g 101 nodeuser
    
USER nodeuser

WORKDIR /home/nodeuser

## go to https://github.com/nvm-sh/nvm and check if this is the latest version

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    nvm install node

RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    npm install -g tiddlywiki && \
    npm install -g httpserver

COPY ./twassets .
COPY my.bash_aliases .bash_aliases

CMD /bin/bash
