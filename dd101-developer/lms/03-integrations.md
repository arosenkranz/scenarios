# Datadog Integrations

In the previous lab, you got the Datadog Agent up and running. However, you may have noticed that while log and metric data appeared, it wasn't very useful. This is because different services such as Postgres, Python, or Ruby all produce different types of data and the Datadog app doesn't automatically know exactly which one is which without being told what to expect. This is where integrations come in.

Most integrations come out-of-the-box with the Datadog Agent, but they can also be used with your other services such as Slack, AWS, and Azure, or configured at the application-level when you aren't using the Agent. For this course, you'll focus on using out of the box integrations with the Agent in a Docker environment.

Setting up an integration with the Agent in a Docker environment requires different configuration values for each service listed in a `docker-compose` file, all of which are provided and well-documented for you in the Datadog application. You'll see for yourself in the following lab, where you'll set these values for difference services so Datadog can make better sense of the data it receives.
