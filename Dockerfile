# Create BUILD IMAGE and build
FROM node:10 AS build-env
WORKDIR /build/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Create RUN IMAGE
FROM node:10
COPY --from=build-env /build/src/app/package*.json /
RUN npm ci --only=production
COPY --from=build-env /build/src/app/dist /dist
ENV NODE_ENV prod
ENV PORT 80
EXPOSE 80
CMD ["node", "./dist/index.js"]
