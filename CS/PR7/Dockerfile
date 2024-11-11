# Use the official Node.js base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json if present
COPY package*.json ./

# Install dependencies (only express is required here)
RUN npm install express

# Copy all files to the working directory
COPY ./public ./

# Expose the port on which the app will run
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
