Course Introduction
===

In this course you're going to work with Storedog, a fully functional e-commerce application running on a few Docker containers managed by Docker Compose. You may be familiar with Storedog if you have completed other Datadog courses in the Learning Center. It's a great application for learning about Datadog because it consists of a variety of common web application technologies. Here's a summary of the services that comprise Storedog:

| Service        | Purpose |
| ---            | ---        |
| db             | PostgreSQL database used by all services |
| frontend       | Spree, an open source e-commerce framework written in Ruby |
| discounts      | Python Flask API that serves store item discounts |
| advertisements | Python Flask API that serves advertisements |
| agent          | The Datadog Agent, which will collect metrics from all of the services and send them to the Datadog platform. |

This course will familiarize you with the three types of Datadog's Synthetic Monitoring tests: API tests, multistep API tests, and browser tests. These tests are called "synthetic" because they simulate requests and actions your end users would make on your application.

You'll set up tests to monitor the health of the Storedog homepage and discounts API. Then you'll build a robust browser test that will ensure that the discounts service data is rendered correctly on the Storedog homepage and that end users can consequently benefit from coupon codes as expected.

By the conclusion of this course, you will be able to:
  - Have a good understanding of the different Datadog Synthetic tests and know when you should use one or the other
  - Set up monitoring on your API endpoints for basic validation as well as sophisticated workflows testing
  - Create and run tests to ensure key user journeys are always available to your end users
  - Configure actionable alerts that will notify the right people in case of issue with your application
