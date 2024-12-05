### Build
# Use Node Alpine
FROM node:18-alpine as build

# Specific working space
WORKDIR /app

# Copy source code to container
COPY . .

# Install dependences and build
RUN npm i
RUN npm run build

### Run by NGINX
# Use Nginx Alpine
FROM nginx:alpine

# Copy from previous step to default nginx folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Run project by NGINX
CMD ["nginx","-g","daemon off;"]
