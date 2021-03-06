#FROM node:6.9.2
FROM mhart/alpine-node:6.9.2

# install bash
RUN apk update 
RUN apk upgrade 
RUN apk add bash

# Configure the app
ARG APP_NAME=minesweeper
EXPOSE 8081
ENV PORT 8081

# Set up the application directory
RUN mkdir -p /home/${APP_NAME}
COPY . /home/${APP_NAME}

# Install and run the server
WORKDIR /home/${APP_NAME}
RUN npm install
RUN ls /home/${APP_NAME}

# //TODO - use npm instead
CMD node server.js