# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy the local files to the container's workspace
COPY . .

# Install dependencies
RUN npm install

# Fetch the game data
RUN node src/update-games-data.js

# Build the frontend
RUN npm run build

# Install a lightweight web server
RUN npm install -g serve

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Serve the frontend files
CMD ["serve", "-s", "dist", "-l", "5000"]
