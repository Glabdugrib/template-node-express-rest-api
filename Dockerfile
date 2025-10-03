FROM node:24

WORKDIR /app

# Copy only package.json and lockfile
COPY package.json pnpm-lock.yaml* ./

# Enable pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate && pnpm install --prod

# Copy TypeScript build
COPY dist ./dist

# Expose production port
EXPOSE 3000

# Start server
CMD ["node", "dist/server.js"]
