bash
```
npm i -D prettier
```
```
npm i -D prettier prettier-plugin-tailwindcss
```

.prettierrc.json
```
{
  "arrowParens": "always",
  "bracketSpacing": true,
  "endOfLine": "lf",
  "htmlWhitespaceSensitivity": "css",
  "insertPragma": false,
  "singleAttributePerLine": false,
  "bracketSameLine": false,
  "jsxSingleQuote": false,
  "printWidth": 80,
  "proseWrap": "preserve",
  "quoteProps": "as-needed",
  "requirePragma": false,
  "semi": true,
  "singleQuote": false,
  "tabWidth": 2,
  "trailingComma": "es5",
  "useTabs": false,
  "embeddedLanguageFormatting": "auto",
  "plugins": ["prettier-plugin-tailwindcss"]
}
```

.prettierignore
```
node_modules
.next
yarn.lock
package-lock.json
public
.github
.vscode
.prettierrc.*
```

package.json E
```
,
    "format": "prettier --write ."
```
```
    "format": "prettier --write ."
```

