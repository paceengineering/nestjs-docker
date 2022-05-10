FROM node:16.13.2-alpine3.15 AS builder

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

FROM node:16.13.2-alpine3.15 AS production
LABEL maintainer="Pace Engineers<maintainer@pace.engineering>"

ARG UID=1000
ARG GID=1000

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app
COPY . .
RUN npm install --only=production
COPY --chown=$UID:$GID --from=builder /usr/src/app/dist ./dist
USER $UID

CMD ["node", "dist/main"]
EXPOSE 3000

STOPSIGNAL SIGQUIT
