FROM node:18-alpine as base

WORKDIR /app
COPY package*.json .
COPY mods ./mods
EXPOSE 3000

FROM base as production
ENV NODE_ENV=production
RUN npm run setup
COPY . .
CMD ["node", "."]

FROM base as dev
ENV NODE_ENV=development
RUN npm run setup:dev
CMD ["nodemon", "."]
