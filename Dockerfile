FROM node:alpine

MAINTAINER Maik Herrmann <maik.herrmann@main-method.com>

RUN apk update && apk upgrade && \
    apk add --no-cache git curl

ENV HOME=/opt/intergram
ENV PORT=3000
#RUN mkdir -p $HOME

ADD . /opt/intergram
WORKDIR $HOME

#RUN git clone https://github.com/mipmip/intergram.git ${HOME}

RUN apk del git

#COPY package*.json ./

RUN npm install

RUN echo $TELEGRAM_TOKEN
#COPY . .

#RUN npm run build

HEALTHCHECK CMD curl --fail http://localhost:${PORT} || exit 1

CMD npm run start
EXPOSE ${PORT}
