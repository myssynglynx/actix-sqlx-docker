/** @type {import('ts-jest').JestConfigWithTsJest} */
module.exports = {
    testEnvironment: 'jsdom',
    transform: {
        "^.+\\.tsx?$": "babel-jest",
        "^.+\\.ts?$": "babel-jest",
        "^.+\\.svg$": "<rootDir>/svgTransform.cjs" ,

    },
    setupFiles: ["<rootDir>/test/setEnvVars.js"],
}

