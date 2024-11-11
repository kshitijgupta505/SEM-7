FROM node:18-alpine

# Set the working directory and ensure permissions are set for the node user
WORKDIR /home/node/app

# Copy package.json and package-lock.json first to avoid re-installing dependencies when code changes
COPY package*.json ./

# Install dependencies as root to avoid permission issues, but before switching users
RUN npm install

# Switch to the node user once dependencies are installed
USER node

# Copy application source code with appropriate permissions
COPY --chown=node:node . .

# Expose the application port
EXPOSE 3000

# Run the application
CMD [ "node", "app.js" ]
