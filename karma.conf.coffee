module.exports = (config) ->
  config.set
    frameworks: ["jasmine"]
    files: [
        "public/lib.js"
        "public/all.js"
        "test/**/*.coffee"
    ]
    exclude: []
    preprocessors:
      "**/*.coffee": ["coffee"]
    reporters: ["progress"]
    port: 9876
    colors: true
    logLevel: config.LOG_INFO
    autoWatch: true
    browsers: ["Chrome"]
    singleRun: false