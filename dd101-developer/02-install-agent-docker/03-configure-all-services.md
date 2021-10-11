Now that you see how much information the Agent and surface with a little configuration, you can configure the rest of the application services.

For your comfort, there is a fully-configured Docker Compose file already in the filesystem. 

1. In the terminal, stop the application services `docker-compose down`{{execute}}
1. Copy the full Docker Compose file with the command `cp /root/docker-compose-complete.yml /root/lab/docker-compose.yml`{{execute}}
1. Restart the application services with `docker-compose up -d`{{execute}}
1. While you wait for that to start up and send data to Datadog, open the new `docker-compose.yml`{{open}} file in the IDE.
1. Notice that all of the services are now configured using environment variables and labels similar to the `discounts` service.
1. In the Datadog App, take a tour of the areas you looked at earlier: **Infrastructure**, **APM**, and **Logs**. Notice the new metadata, services, traces, and log information.

    Note that it can take a while for newly configured data be processed by Datadog and displayed.
1. In the terminal, run the `finish`{{execute}} command.

Click the **Continue** button to conclude this lab.