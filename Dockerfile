# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Build argument for NEXT_PUBLIC variables
ARG BEDROCK_KNOWLEDGE_BASE_ID
ARG BEDROCK_KNOWLEDGE_BASE_NAME

# Set environment variables
ENV NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID=$BEDROCK_KNOWLEDGE_BASE_ID
ENV NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME=$BEDROCK_KNOWLEDGE_BASE_NAME

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the app
CMD ["npm", "start"]

# 1.  Build a docker image with this command:
# docker build \
  #  --build-arg BEDROCK_KNOWLEDGE_BASE_ID=YOUR-KNOLEDGE-BASE-ID \
  #  --build-arg BEDROCK_KNOWLEDGE_BASE_NAME=YOUR-KNOWLEDGE-BASE-NAME \
  #  -t YOUR-IMAGE-NAME .

# 2. Run a container with this command:
# docker run -p 3000:3000 --name YOUR-CONTAINER-NAME --env-file .env.local YOUR-IMAGE-NAME

# 3 Create a 'env.local' file and pass in the following expected keys:
# ANTHROPIC_API_KEY=sk-ant-YOUR-ANTHROPIC-API-KEY
# BAWS_ACCESS_KEY_ID=AKIA-YOUR-AWS=ACCESS-KEY
# BAWS_SECRET_ACCESS_KEY=YOUR-AWS-SECRET-ACCESS-KEY



