FROM node:28-slim AS build
WORKDIR /usr/src/app
COPY src/package*.json ./
ENV NODE_ENV=production
RUN npm ci --only=production
COPY src .

FROM gcr.io/distroless/nodejs:28
WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
EXPOSE 3000
CMD ["app.js"]

