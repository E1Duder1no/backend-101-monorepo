mkdir -p apps/$1/src

touch apps/$1/src/index.ts
touch apps/$1/README.md

cp .gitignore apps/$1/.gitignore

echo "# $1 app" > apps/$1/README.md

npm init -w apps/$1 --scope=@app --type=module -y
npm i -w apps/$1
npm i -D -w apps/$1 typescript esbuild @types/node @package/typescript-configs@* nodemon ts-node jest ts-jest @types/jest @types/supertest

cd apps/$1

npx tsc --init --noEmit --rootDir ./src --outDir ./dist --module esnext --target esnext --moduleResolution node --resolveJsonModule true

npm pkg set scripts.build="node esbuild.build.js"
npm pkg set scripts.check-types="tsc --noEmit"
npm pkg set scripts.dev="nodemon src/index.ts"
npm pkg set scripts.test="jest"
npm pkg set version=0.0.0
npm pkg set license=MIT

cp -R ../../templates/app/* .
