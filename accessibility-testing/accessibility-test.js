const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ args: ['--no-sandbox'] });
  const page = await browser.newPage();
  await page.goto('http://localhost:5000', { waitUntil: ['networkidle0', 'domcontentloaded'] });
  await page.addScriptTag({ path: './accessibility-testing/axs_testing.js' });
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
      process.exit(1);
    }
  });
})();
