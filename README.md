# Strudel Songs
## How to start Strudel locally
- *Automatic*
  - Execute `./start-strudel.sh` in `strudel/songs`
- *Manual*
  - Go to `strudel/server` and run  `pnpm dev` to start the Strudel Web Server
  - Go to `strudel/samples` and run `pnpm dlx @strudel/sampler` to start the Sample Server
  - Open `http://localhost:4321/` in browser 
> Either way: use `await samples('http://localhost:5432/')` in the top of your Strudel songs, to load samples from the local Sample Server

## How to initially setup and start Strudel locally
**Requirements**
- [Node.js](https://nodejs.org/en/) -> ideally via [npm](https://www.npmjs.com/)
- [pnpm](https://pnpm.io/installation) -> ideally via [homebrew](https://docs.brew.sh/Installation)

**Setup and initial start**
- Create a folder `strudel` and switch into it
- **Server**
  - Run `git clone https://codeberg.org/uzu/strudel.git server` to clone the Strudel server
  - Switch into `server`
  - Run `pnpm i` to install dependencies
  - Run `pnpm dev` to run the server
- **Samples**
  - Switch back into the `strudel` folder
  - Run `git clone https://github.com/felixroos/dough-samples.git samples` to clone the strudel default samples
  - Switch into the `samples` folder
  - Run `chmod +x ../songs/rename-dash-to-underscore-recursively.sh` and then `./../songs/rename-dash-to-underscore.sh` to rename all folders with dashes to underscores 
    >(This is required,due to some samples being named with dashes, but Strudel REPL [banks](https://strudel.cc/learn/samples/#sound-banks) using underscores when resolving names)
  - Run `pnpm dlx @strudel/sampler` to start the Sample Server