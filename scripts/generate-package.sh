mkdir -p packages/$1/src

touch packages/$1/src/index.ts
touch packages/$1/README.md

cp .gitignore packages/$1/.gitignore

echo "# $1 lib" > packages/$1/README.md

npm init -w packages/$1 --scope=@package --type=module -y
npm i -D -w packages/$1 @types/node typescript esbuild

cd packages/$1

npx tsc --init --noEmit --rootDir ./src --outDir ./lib --module esnext --target esnext --moduleResolution bundler --resolveJsonModule true

npm pkg set scripts.build="node esbuild.build.js"
npm pkg set scripts.check-types="tsc --noEmit"
npm pkg set scripts.dev="Running dev script for package: $1"
npm pkg set version=0.0.0
npm pkg set license=MIT

cp -R ../../templates/package/* .