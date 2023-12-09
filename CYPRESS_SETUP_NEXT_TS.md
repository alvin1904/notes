# Setting up Cypress in a Next Js - TypeScript Project

Read more: https://dev.to/alvin1904/setting-up-cypress-for-end-to-end-testing-in-nextjs-with-typescript-5e7d

### Installation

```
npm install -D cypress concurrently
```

### Editing your tsconfig to prevent errors

```json
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
```

[More about module resolution](https://www.notion.so/More-about-module-resolution-e9539908dec34613ad379c86c32840b8?pvs=21)

### Adding scripts to package.json

```
"e2e": "concurrently \"npm run dev\" \"cypress open --e2e\"",
"e2e:cli": "concurrently \"npm run dev\" \"cypress run --e2e\"",
"component": "cypress open --component",
"component:cli": "cypress run --component"
```

### Create a cypress.config.ts

```jsx
import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    // baseUrl: "http://localhost:3000",
  },
  component: {
    devServer: {
      framework: "next",
      bundler: "webpack",
    },
  },
});
```

### Start Using Cypress

```
npm run e2e
```
