# Use node alpine
FROM node:18-alpine

# Specific working space
WORKDIR /app

# Copy source code to container
COPY . .

# Install snyk and snyk-to-html
RUN npm install -g snyk
RUN npm install snyk-to-html -g

# Create variable to auth. It can be specific outsite
ARG SNYK_AUTH_TOKEN
ENV SNYK_AUTH_TOKEN=$SNYK_AUTH_TOKEN

ARG OUTPUT_FILENAME
ENV OUTPUT_FILENAME=$OUTPUT_FILENAME

RUN snyk auth $SNYK_AUTH_TOKEN && snyk test --json | snyk-to-html -o $OUTPUT_FILENAME.html || true
