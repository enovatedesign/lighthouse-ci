FROM ubuntu:18.04

# Labels
LABEL maintainer = "Matt Banner <matt.banner@enovate.co.uk>"

# Environment Variables
ENV DEBIAN_FRONTEND noninteractive
ENV NODE_VERSION 10.x
ENV LHCI_VERSION 0.3.x

# Single Run Layer
RUN \
     apt-get update \
     && apt-get install -y \
        curl \
        wget \
        software-properties-common \
    && curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} -o nodesource_setup.sh \
    && bash ./nodesource_setup.sh \
    && apt-get update \
    && apt-get install -y nodejs \
    && npm i -g npm@latest \
    && npm i -g @lhci/cli@${LHCI_VERSION} --unsafe-perm=true \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update -qqy \
	&& apt-get -qqy install google-chrome-stable \
	&& rm /etc/apt/sources.list.d/google-chrome.list \
	&& sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /etc/apt/sources.list.d/google-chrome.list
