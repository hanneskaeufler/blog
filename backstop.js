var isCI = process.env.CI == "true";
var host = isCI ? "http://localhost:5000" : "http://host.docker.internal:5000";
var dataDir = isCI ? "backstop_data" : "src/backstop_data";

module.exports = {
  "id": "backstop_default",
  "viewports": [
    {
      "label": "phone",
      "width": 320,
      "height": 480
    },
    {
      "label": "tablet",
      "width": 1024,
      "height": 768
    },
    {
      "label": "desktop",
      "width": 2880,
      "height": 1800
    }
  ],
  "onBeforeScript": "puppet/onBefore.js",
  "onReadyScript": "puppet/onReady.js",
  "scenarios": [
    {
      "label": "Blog Index",
      "url": host
    },
    {
      "label": "Blog Sample Post",
      "url": host + "/posts/sample-post"
    },
    {
      "label": "Blog Archive",
      "url": host + "/archive"
    }
  ],
  "paths": {
    "bitmaps_reference": dataDir + "/bitmaps_reference",
    "bitmaps_test": dataDir + "/bitmaps_test",
    "engine_scripts": dataDir + "/engine_scripts",
    "html_report": dataDir + "/html_report",
    "ci_report": dataDir + "/ci_report"
  },
  "report": ["ci"],
  "engine": "puppeteer",
  "engineOptions": {
    "args": ["--no-sandbox", "--disable-setuid-sandbox"]
  },
  "asyncCaptureLimit": 5,
  "asyncCompareLimit": 50,
  "debug": false,
  "debugWindow": false
}
