FROM node:16-alpine
RUN npm install -g firebase-tools
RUN npm install -g typescript
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
