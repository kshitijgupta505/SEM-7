# # Use the official Node.js base image
# FROM node:18-alpine

# # Set the working directory inside the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json if present
# COPY package*.json ./

# # Install dependencies (only express is required here)
# RUN npm install express

# # Copy all files to the working directory
# COPY ./public ./

# # Expose the port on which the app will run
# EXPOSE 3000

# # Start the server
# CMD ["node", "server.js"]
# Use the official Node.js base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json if present
COPY package*.json ./

# Install all dependencies specified in package.json
RUN npm install --production

# Copy the rest of the application files
COPY . .

# Ensure the correct ownership of the application files
RUN chown -R node:node /usr/src/app

# Use a non-root user for security purposes
USER node

# Expose the port on which the app will run
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
