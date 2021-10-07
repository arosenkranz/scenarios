const puppeteer = require('puppeteer');

const startUrl = process.env.STOREDOG_URL;
const micrositeUrl = process.env.MICROSITE_URL;

const getNewBrowser = async () => {
  const browser = await puppeteer.launch({
    defaultViewport: null,
    timeout: 15000,
    slowMo: 1000,
    args: [
      // Required for Docker version of Puppeteer
      '--no-sandbox',
      '--disable-setuid-sandbox',
      // This will write shared memory files into /tmp instead of /dev/shm,
      // because Docker’s default for /dev/shm is 64MB
      '--disable-dev-shm-usage',
    ],
  });
  const browserVersion = await browser.version();
  console.log(`Started ${browserVersion}`);
  return browser;
};

const runSession = async (url, selectors) => {
  const browser = await getNewBrowser();
  let page = await browser.newPage();

  try {
    await page.setDefaultNavigationTimeout(40000);
    await page.goto(url, { waitUntil: 'domcontentloaded' });
    const pageTitle = await page.title();
    console.log(`"${pageTitle}" loaded`);

    for (const selector of selectors) {
      await page.waitForSelector(selector);
      console.log(`Going to click on ${selector}...`);
      await Promise.all([page.waitForNavigation(), page.click(selector)]);
    }
  } catch (err) {
    console.log(`Session failed: ${err}`);
  } finally {
    browser.close();
  }
};

// Session 1
(async () => {
  const selectors = [
    '#search-bar > .ml-2 > .btn',
    '#taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(1)',
    '.breadcrumb > .breadcrumb-item:nth-child(1) > span > a > span',
  ];
  await runSession(startUrl, selectors);
})();

// Session 2
(async () => {
  const selectors = [
    '#product_2 > .card > .card-body > .d-block > .info',
    '#add-to-cart-button',
  ];
  await runSession(startUrl, selectors);
})();

// Session 3
(async () => {
  const selectors = [
    'div > #taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(1)',
    '.row > #sidebar > div > #sidebar_products_search > .btn',
    '.container > #main-nav-bar > .nav > #home-link > .nav-link',
  ];
  await runSession(startUrl, selectors);
})();

// Session 4
(async () => {
  const selectors = [
    'div > #taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(3)',
    '#product_8 > .card > .card-body > .d-block > .info',
    '#add-to-cart-button',
    '#home-link > .nav-link',
  ];
  await runSession(startUrl, selectors);
})();

// Session 5
(async () => {
  const selectors = [
    'div > #taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(3)',
    '#product_8 > .card > .card-body > .d-block > .info',
    '#add-to-cart-button',
    '#home-link > .nav-link',
  ];
  await runSession(startUrl, selectors);
})();

// Session 6
(async () => {
  const selectors = [
    'tbody tr:nth-child(3) button',
    'tbody tr:nth-child(25) button',
    'thead th:nth-child(2)',
    'footer button.text-underline',
    'tbody tr:nth-child(5) button',
    'tbody tr:nth-child(10) button',
    'header button.text-underline',
    'thead th:first-child',
    'tbody tr:nth-child(25) button',
    'header button.text-underline',
    'thead th:first-child',
    'tbody tr:nth-child(10) button',
    'footer button.text-underline',
  ];

  const browser = await getNewBrowser();
  let page = await browser.newPage();

  try {
    console.log(`Heading to ${micrositeUrl}`);
    await page.goto(`${micrositeUrl}?ref="storedog"`, {
      waitUntil: 'domcontentloaded',
    });
    const pageTitle = await page.title();
    console.log(`"${pageTitle}" loaded`);

    for (const selector of selectors) {
      await page.waitForSelector(selector);
      console.log(`Going to click on ${selector}...`);
      await page.click(selector);
    }
  } catch (err) {
    console.error(`Session failed: ${err}`);
  } finally {
    browser.close();
  }
})();

// Session 7
(async () => {
  const selectors = [
    '#product_2 > .card > .card-body > .d-block > .info',
    '#add-to-cart-button',
  ];
  const browser = await getNewBrowser();
  let page = await browser.newPage();

  try {
    await page.setDefaultNavigationTimeout(30000);
    await page.goto(startUrl, { waitUntil: 'domcontentloaded' });
    const pageTitle = await page.title();
    console.log(`"${pageTitle}" loaded`);

    for (const selector of selectors) {
      await page.waitForSelector(selector);
      console.log(`Going to click on ${selector}... COUPON`);
      await Promise.all([page.waitForNavigation(), page.click(selector)]);
    }
    const coupons = ['SORRY', 'REBUILD', 'HEARTS', 'STOREDOG', 'SUNSHINE'];

    await page.waitForSelector('input#order_coupon_code');

    await page.type(
      'input#order_coupon_code',
      coupons[Math.floor(Math.random() * coupons.length)],
      { delay: 100 }
    );
    await page.click('[data-hook="coupon_code"] button[type="submit"]');
  } catch (err) {
    console.log(`Session failed: ${err}`);
  } finally {
    browser.close();
  }
})();

// Session 6
(async () => {
  const selectors = [
    'header button.text-underline',
    'footer button.text-underline',
  ];

  const browser = await getNewBrowser();
  let page = await browser.newPage();

  try {
    console.log(`Heading to ${micrositeUrl}`);
    await page.goto(micrositeUrl, { waitUntil: 'domcontentloaded' });
    const pageTitle = await page.title();
    console.log(`"${pageTitle}" loaded`);

    for (const selector of selectors) {
      await page.waitForSelector(selector);
      console.log(`Going to click on ${selector}...`);
      await page.click(selector);
    }
  } catch (err) {
    console.error(`Session failed: ${err}`);
  } finally {
    browser.close();
  }
})();
