# Use the official lightweight Node.js image (Alpine Linux is small and secure)
# We pin the major version (22) for consistency
FROM node:22-alpine

# Set the working directory inside the container where all subsequent commands will run
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker's layer caching
COPY package*.json ./

# Install only production dependencies inside the container
# --omit=dev ensures devDependencies are skipped for smaller image size
RUN npm ci --omit=dev

# Copy the rest of the application source code into the container's working directory
COPY . .

# Document that the container listens on port 3000 at runtime
EXPOSE 3000

# Define the default command to run when the container starts
CMD ["npm", "start"]