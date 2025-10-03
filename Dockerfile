# Build stage
FROM node:24 AS builder

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml* ./

# Enable pnpm and install all dependencies (including devDependencies)
RUN corepack enable && corepack prepare pnpm@latest --activate && pnpm install

# Copy source code
COPY . .

# Build TypeScript
RUN pnpm build

# Production stage
FROM node:24 AS production

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml* ./

# Enable pnpm and install only production dependencies
RUN corepack enable && corepack prepare pnpm@latest --activate && pnpm install --prod --ignore-scripts

# Copy built application from builder stage
COPY --from=builder /app/dist ./dist

# Expose production port
EXPOSE 3000

# Start server
CMD ["node", "dist/server.js"]
