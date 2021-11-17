Now that you have given the discounts service unique tags, you can configure the rest of the application services.

For your comfort, there is a fully-configured Docker Compose file already in the filesystem. 

1. In the terminal, stop the application services `docker-compose down`{{execute}}

1. Copy the full Docker Compose file with the command `cp /root/docker-compose-complete.yml /root/lab/docker-compose.yml`{{execute}}

1. Restart the application services with `docker-compose up -d`{{execute}}

1. While you wait for that to start up and send data to Datadog, open the new `docker-compose.yml`{{open}} file in the IDE.

1. Notice that all of the services are now configured using labels similar to the `discounts` service.

1. Each service now has `datadog` listed under `depends-on`. This prevents services from starting up before the Agent can gather their data.

1. In the Datadog App, take a tour of the areas you looked at earlier: **Infrastructure** and **Logs**. Notice the new tags for each service.

When you are done with this section, run the `finish`{{execute}} command.

Click the **Continue** button to conclude this lab.