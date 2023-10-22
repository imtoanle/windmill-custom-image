FROM ghcr.io/windmill-labs/windmill:main

RUN apt update
RUN apt install npm -y
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN wget -qO /etc/apt/trusted.gpg.d/google_linux_signing_key.asc https://dl.google.com/linux/linux_signing_key.pub
RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update -y
RUN apt install nodejs libnss3-dev  libatk1.0-0 libatk-bridge2.0-0 libcups2-dev  libdrm-dev libxkbcommon-dev libxcomposite-dev libxdamage-dev libxrandr-dev\
  libgbm-dev libpango-1.0-0 libcairo-dev libasound-dev -y
RUN apt install -y google-chrome-stable
RUN npm install -g puppeteer -y

CMD ["windmill"]