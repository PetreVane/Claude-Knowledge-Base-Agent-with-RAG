# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Build argument for NEXT_PUBLIC variables
ARG NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID
ARG NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME
ARG REGION
ARG ANTHROPIC_API_KEY
ARG BAWS_ACCESS_KEY_ID
ARG BAWS_SECRET_ACCESS_KEY

# Set environment variables
ENV NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID=$NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID
ENV NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME=$NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME
ENV REGION=$REGION
ENV ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY
ENV BAWS_ACCESS_KEY_ID=$BAWS_ACCESS_KEY_ID
ENV BAWS_SECRET_ACCESS_KEY=$BAWS_SECRET_ACCESS_KEY

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the applicaiton
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the app
CMD ["npm", "run", "start"]

# 1.  Build a docker image with this command:
# docker build \
  #  --build-arg NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_ID=YOUR-KNOLEDGE-BASE-ID \
  #  --build-arg NEXT_PUBLIC_BEDROCK_KNOWLEDGE_BASE_NAME=YOUR-KNOWLEDGE-BASE-NAME \
  #  -t YOUR-IMAGE-NAME .

# 2. Run a container with this command:
# docker run -p 3000:3000 --name YOUR-CONTAINER-NAME --env-file .env.local YOUR-IMAGE-NAME

# 3 Create a 'env.local' file and pass in the following expected keys:
# ANTHROPIC_API_KEY=sk-ant-YOUR-ANTHROPIC-API-KEY
# BAWS_ACCESS_KEY_ID=AKIA-YOUR-AWS=ACCESS-KEY
# BAWS_SECRET_ACCESS_KEY=YOUR-AWS-SECRET-ACCESS-KEY



