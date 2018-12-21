# Elm SPA starter

Initialize a SPA stack composed with:
- A header: with a logo icon and a navigation menu (to expose some routes)
- A content: depending on the page to load (from the URL being loaded)
- A footer 

## Startup

### MacOS

Prerequisites: [Homebrew](https://brew.sh/index_fr)

- Install elm: `brew install elm`
- Install or update npm: `brew install npm` or `brew upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

### Unix 
- Install elm: `apt-get install elm`
- Install or update npm: `apt-get install npm` or `apt-get upgrade npm`
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

### Windows
- Install elm: [Windows Installer](https://guide.elm-lang.org/install.html)
- Install or update npm: [Node](https://nodejs.org/en/download/)
- Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`
- Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js`

## Technologies 
Written in [Elm 0.19.0](https://elm-lang.org/)

![Elm logo](doc/images/elm_logo.png)

### Hot-reload
Install [elm-live](https://github.com/wking-io/elm-live): `npm install -g elm-live`

Start application: `elm-live src/Main.elm --port=1234 --open -- --output=main.js --debug`

### Formatter
Install [elm-format](https://github.com/avh4/elm-format) following this startup guide: [Install Elm format](https://github.com/avh4/elm-format)

This aims to format using Elm style guide when saving.