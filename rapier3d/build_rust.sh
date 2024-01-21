#! /bin/sh

npx wasm-pack build
sed -i.bak 's#dimforge_rapier#@dimforge/rapier#g' pkg/package.json
sed -i.bak 's/"rapier_wasm3d_bg.wasm"/"*"/g' pkg/package.json
rm pkg/*.bak
rm pkg/.gitignore

# a slightly ugly way to munge the files to work with my bundler
sed -i '2,3d'  pkg/rapier_wasm3d.js
sed -i '1,4d' pkg/rapier_wasm3d_bg.js
sed -i '1s!.*!import * as wasm from "./rapier_wasm3d_bg.wasm";!' pkg/rapier_wasm3d_bg.js
