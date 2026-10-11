# Provide the Node.js runtime required by this assignment.
FROM node:16

# Run the remaining build steps and application inside this directory.
WORKDIR /app

# Copy the dependency manifests before the source to reuse cached installs.
COPY package*.json ./

# Install the Express dependency declared in package.json.
RUN npm install

# Copy the existing application and public files into the image.
COPY . .

# Document the application port; docker run publishes it to the host.
EXPOSE 3000

# Start the server using the package.json start script.
CMD ["npm", "start"]
