const puppeteer = require('puppeteer'),
  exit = () => { process.exit(1); },
  TEST_URL = 'http://localhost:5000',
  A11Y_SCRIPT = './accessibility-testing/axs_testing.js';

(async () => {
  const browser = await puppeteer.launch({ args: ['--no-sandbox'] });
  const page = await browser.newPage();
  await page
    .goto(TEST_URL, { waitUntil: ['networkidle0', 'domcontentloaded'] })
    .catch(exit);

  await page.addScriptTag({ path: A11Y_SCRIPT });
  let axs = await page.evaluate(() => {
    let auditConfig = new axs.AuditConfiguration();
    auditConfig.scope = document;
    let results = axs.Audit.run(auditConfig);
    let auditResults = axs.Audit.auditResults(results);

    return {
      report: axs.Audit.createReport(results),
      results: results
    }
  });

  await browser.close();

  console.log(axs.report);

  axs.results.forEach((res) => {
    if (res.result === 'FAIL') {
      console.error('There have been accessibility failures!');
      exit();
    }
  });
})();
