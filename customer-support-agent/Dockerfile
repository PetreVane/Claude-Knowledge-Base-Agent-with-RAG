# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Build argument for NEXT_PUBLIC variables
ARG NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID
ARG NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME

# Set environment variables
ENV NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID=$NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID
ENV NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME=$NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the app
CMD ["npm", "start"]
