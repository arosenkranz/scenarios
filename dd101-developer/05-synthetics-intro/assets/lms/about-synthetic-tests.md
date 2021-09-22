Introduction
===
Synthetic tests allow you to observe how your systems and applications are performing using simulated requests and actions from around the globe. Datadog tracks the performance of your webpages, APIs, and systems from the backend to the frontend, and at various network levels (HTTP, TCP, SSL, DNS, and ICMP) in a controlled and stable way. 

Synthetic tests can be run on a schedule, on demand, and directly within your CI/CD pipeline. In this course, we’ll focus on running tests on a schedule and on demand, notably in the context of production applications monitoring. 

In case of faulty behavior such as a regression, broken feature, high response time, unexpected status code, and more, an alert will be triggered, allowing you to find problems before your users do. 

Once you have Synthetic Monitoring up and running, you can incorporate its metrics into dashboards to create visualizations about your systems performance for your teams but also use [Service Level Objectives](https://docs.datadoghq.com/monitors/service_level_objectives/) (SLOs) to define and track your performance targets. 

There are three types of Synthetic tests: API tests, multistep API tests, and browser tests.

API Tests
---
API tests are useful to help you proactively monitor that your most important services are always available. There are four types of API tests that allow you to launch requests on the different network layers of your systems, and evaluate the values of their responses thanks to assertions. An assertion defines the expected behavior of your test.

| test type | assessable data |
| ---       | ---             |
| HTTP      | response time, status code, body content, header properties |
| SSL       | response time, certificate validity, certificate expiration date, certificate properties, TLS version |
| TCP       | response time, connection |
| DNS       | response time, records (A, AAAA, CNAME, MX, NS, TXT) |
| ICMP      | latency, network hops, packet loss, packets received |

Each test's request can be configured as appropriate for the type. For example, HTTP tests allow you to configure assertions on common HTTP response attributes to answer questions like, “Does the JSON payload returned by my endpoint contain that specific value?”. DNS tests allow you to configure lookups on your domains and test all your critical records using specific DNS servers.

![Animated screencap of creating and running an API test](api-test.gif)

Multistep API Tests
---
Multistep API tests allow you to chain multiple HTTP requests in a single test. They are suitable for monitoring sophisticated business transactions, where the response from one service request can be used in subsequent requests. For example, to get an authentication token prior to making further requests to protected API endpoints, or to model complex mobile app journeys across your API endpoints. Multistep API tests are also a great fit to bundle a collection of independent requests into a single test.

![Animated screencap of creating and running a multistep API test](multistep-api-test.gif)

Browser Tests
---
Browser tests allow you to create recordings of key business flows to make sure critical functionalities of your applications are always accessible to your end users.

Browser tests make requests using a browser, just like humans do. You can record a user flow thanks to a Chrome extension, and evaluate almost any interactions a user would have with your web application. For example, when you open your application's home page, is the title correct? Can you add a product to the shopping cart as expected? Did the HTTP response arrive in under 300ms?

Datadog's browser tests don't have to be reconfigured every time your application's frontend changes. For instance, when a button in your web app is moved or the identifier of an element changes, browser tests infer how to carry out the existing test in the updated UI. 

Like API tests, you can run your browser tests from a variety of locations both public and private. Additionally, you can configure the screen dimensions of the device running the test (laptop, tablet, mobile), as well as the browser to use (Chrome, Firefox).

![Animated screencap of creating and running a browser test](browser-test.gif)

Like Multistep API tests, you can chain many user actions and assertions together in a single test. Browser tests will generate a screenshot for every assertion, so you can see exactly what your users would see. Furthermore, Datadog Synthetic browser tests are tightly integrated with the rest of the platform, so you have access to end-to-end context for troubleshooting, from application logs and distributed request traces to infrastructure metrics.

Test Locations
---
All of the Datadog synthetic test types allow you to choose which geographical regions to run them from. This is useful to see what the experience is like for users from around the globe. 

Speaking of locations, you can also test internal services that are not public facing. Learn how to monitor private locations, see [Getting Started with Private Locations](https://docs.datadoghq.com/getting_started/synthetics/private_location/).

Monitoring and Alerts
---
API tests can be configured to run at intervals from 1 minute to 1 week. Browser tests can be configured to run as at intervals from 5 minutes to 1 week.

You can configure your test to automatically retry in case of failure and tweak your alerting conditions based on the failure duration and the number of failed locations. This is very useful to ensure your team does not get alerted in case of temporary network blips. 

Alert [notifications](https://docs.datadoghq.com/monitors/notifications/?tab=is_alert) can be configured in the same way as any other Datadog monitor alert.

Now that you're familiar with the different types of Datadog synthetic tests, it's time to lean how to create them in a hands-on lab. Click the **Next** button to begin.
