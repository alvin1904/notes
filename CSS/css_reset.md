```css
/* CSS RESET - Alvin Varghese */
/* https://github.com/alvin1904 */
*,
*::before,
*::after {
  box-sizing: border-box;
}
html {
  -ms-text-size-adjust: 100%; /* 1 */
  -webkit-text-size-adjust: 100%; /* 1 */
  height: 100%;
}
html:focus-within {
  scroll-behavior: smooth;
}
body {
  text-rendering: optimizeSpeed;
}
* {
  margin: 0;
  padding: 0;
  font: inherit;
  /* transition: all ease-in-out 250ms; */
}
a,
button {
  all: unset;
  cursor: pointer;
  text-decoration: none;
  color: inherit;
  background-color: transparent;
}
ol,
ul,
menu {
  list-style: none;
}
img {
  max-inline-size: 100%;
  max-block-size: 100%;
  border-style: none;
}
img,
picture,
svg {
  max-width: 100%;
  display: block;
}
input,
textarea {
  all: unset;
  -webkit-user-select: auto;
  user-select: auto;
  outline-color: transparent;
  border: 0;
}
textarea {
  white-space: revert;
}
::placeholder {
  color: unset;
}
:focus {
  outline: 0;
}
:where([hidden]) {
  display: none;
}
```
