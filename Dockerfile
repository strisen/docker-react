# Build Phase

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#/app/build <---- All the stuff we need


# Run Phase

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html