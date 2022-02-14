# Commencez par construire l'application.
FROM node:16 AS build-env
ADD . /app/hello-world-app
WORKDIR /app/hello-world-app
RUN npm install --production

# Maintenant, copiez-le dans notre image de base.
FROM gcr.io/distroless/nodejs:16
COPY --from=build-env /app /app
WORKDIR /app/hello-world-app
EXPOSE 3000
CMD ["hello_express.js"]