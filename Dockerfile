# read the doc: https://huggingface.co/docs/hub/spaces-sdks-docker
# you will also find guides on how best to write your Dockerfile

FROM node:19

RUN npm install -g pm2

WORKDIR /app

COPY --link --chown=1000 . .

RUN npm i

RUN npm run build

CMD pm2 start build/index.js -i $CPU_CORES --no-daemon
