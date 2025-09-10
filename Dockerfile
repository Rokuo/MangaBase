# Use official Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Build the SvelteKit app (for production)
RUN npm run build

# Expose port
EXPOSE 5173

# Run app
CMD ["npm", "run", "dev", "--open"]
