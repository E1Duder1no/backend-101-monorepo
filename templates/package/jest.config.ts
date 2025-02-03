import { type JestConfigWithTsJest, createDefaultPreset } from 'ts-jest';

const preset = createDefaultPreset();

const config: JestConfigWithTsJest = {
    ...preset,
    verbose: true
};

export default config;
