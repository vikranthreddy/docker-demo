# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:latest as build

# Set the working directory
WORKDIR /usr/local/docker-demo

# Add the source code to app
COPY ./ /usr/local/docker-demo/

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest

#copy nginx.conf file to override default config you customize server configuration and ports in nginx.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/docker-demo/dist/docker-demo/browser /usr/share/nginx/html

# Expose port 4200
EXPOSE 4200