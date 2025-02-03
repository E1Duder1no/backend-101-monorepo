import esbuild from 'esbuild';
import process from 'node:process';
import package_json from './package.json' assert { type: 'json' };

esbuild
    .build({
        bundle: true,
        entryPoints: ['src/**/*.ts'],
        external: Object.entries(package_json.devDependencies || {}),
        format: 'esm',
        keepNames: true,
        logLevel: 'info',
        outdir: './dist',
        platform: 'node',
        splitting: true,
        target: 'nodenext',
        tsconfig: './tsconfig.json',
        treeShaking: true,
    })
    .catch(() => process.exit(1));
