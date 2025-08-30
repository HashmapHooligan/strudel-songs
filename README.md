# Strudel Songs
## How to start Strudel locally
- Go to `strudel/server` and run  `pnpm dev` to start the Strudel Web Server
- Open `http://localhost:4321/` in browser 

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
  - Run `git clone --recurse-submodules https://github.com/felixroos/dough-samples.git samples` to clone the strudel default samples
  - Switch into the `samples` folder
  - Run `npx serve -p 6543 --cors` to serve the samples locally
  - Open `http://localhost:4321/` in browser
  - Paste the following code in the strudel editor and run it once with the `play` button to load the samples into the browser cache
    ```
    const base = 'http://localhost:6543';
    await Promise.all([
      samples(
        base + '/tidal-drum-machines.json',
        base + '/tidal-drum-machines/machines/'
      ),
      samples(base+'/piano.json', base+'/piano/'),
      samples(base+'/Dirt-Samples.json', base+'/Dirt-Samples/'),
      samples(base+'/EmuSP12.json', base+'/tidal-drum-machines/machines/'),
      samples(base+'/vcsl.json', base+'/VCSL/'),
      samples(base+'/mridangam.json', base+'/mrid/'),
    ]);
    ```
    > If you empty your browser cache at some point, you need to redo the steps starting at `npx serve -p 6543`