FROM node AS build

WORKDIR /app
COPY package*.json ./
RUN npm install


FROM node
COPY --from=build /app /app
COPY ./src /app/src

EXPOSE 80
CMD ["node", "/app/src/app.js"]