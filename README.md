# template-node-express-rest-api

Production-ready Node.js REST API template built with **TypeScript** and **Express**, designed as a starting point for new projects.

Includes:

- TypeScript support
- Express routes scaffold
- Development workflow with hot reload (`ts-node + nodemon`)
- Production Docker image
- ESLint + Prettier configuration
- Husky + lint-staged pre-commit hooks
- `.gitignore`, `.dockerignore`, `.nvmrc` included
- Clean folder structure ready for extensions

---

## Table of Contents

- [template-node-express-rest-api](#template-node-express-rest-api)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Development Setup](#development-setup)
  - [Running Locally](#running-locally)
  - [Production with Docker](#production-with-docker)
  - [Linting \& Formatting](#linting--formatting)
  - [Pre-commit Hooks (Husky + lint-staged)](#pre-commit-hooks-husky--lint-staged)

---

## Prerequisites

- Node.js 24+
- pnpm
- Docker (for production image)
- Optional: nvm (`.nvmrc` included to enforce Node version)

```bash
nvm use
pnpm install
```

---

## Development Setup

1. Install dependencies:

```bash
pnpm install
```

1. Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

3. Start development server with hot reload:

```bash
pnpm dev
```

- Server will reload automatically on `.ts` file changes.
- Default endpoint: [http://localhost:3000/api/hello](http://localhost:3000/api/hello)

4. Build TypeScript (optional during dev):

```bash
pnpm build
```

---

## Running Locally

```bash
pnpm dev
```

- Runs server using `ts-node` + `nodemon`.
- Hot reload works on all files in `src/`.

---

## Production with Docker

1. Build TypeScript:

```bash
pnpm build
```

2. Build Docker image:

```bash
docker build -t template-node-express-rest-api .
```

3. Run production container:

```bash
docker run -d -p 3000:3000 --name node-ts-api template-node-express-rest-api
```

4. Check logs:

```bash
docker logs -f node-ts-api
```

5. Stop & remove container:

```bash
docker stop node-ts-api
docker rm node-ts-api
```

> The Docker image contains **only compiled code and production dependencies** for a lightweight, secure deployment.

---

## Linting & Formatting

- ESLint and Prettier configured for TypeScript.
- Scripts available:

```bash
pnpm lint          # runs ESLint
pnpm format        # runs Prettier
```

- `.eslintignore` and `.prettierrc` included.

---

## Pre-commit Hooks (Husky + lint-staged)

- Automatically formats and fixes staged files before commit:

```bash
git add .
git commit -m "your message"
```

- `*.ts` files → ESLint `--fix` + Prettier
- `*.js` files → Prettier
- Automatically re-adds changes to staged files.
- Uses `pnpm exec` internally to ensure local binaries are used.
