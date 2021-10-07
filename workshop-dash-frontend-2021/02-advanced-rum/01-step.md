In the terminal on the right, the environment is being prepared. You will see a message `Provisioning Complete` along with some login credentials when the environment is ready.

Since you already created a RUM application with a name of "Storedog", this lab has already fetched that information and the application is already running. This way you can get right into creating a monitor.

1. Confirm the application is working by running the following command in the terminal:

  ```
  docker ps
  ```{{execute}}

  You should see a list of seven containers running. If not, use `docker-compose down`{{execute}} and `docker-compose up`{{execute}} to restart the containers.

2. Make sure you are logged into your <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity. 

  > **Note:** If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

3. Navigate to the <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitors > New Monitor**</a> page and select the option to create a **Real User Monitoring** monitor.

4. Under **Define the search query**, filter down to the particular error you experienced earlier with the following query:

  ```
  @type:error service:storedog-microsite @error.source:console
  ```{{copy}}

  Since this is already a narrow filter, there's no need to adjust the **Count** or **Group By** options.

5. For **Set Alert Conditions**, set the monitor to trigger when the metric is **Above** the threshold during the last **5 minutes**.

  Then set the **Alert Threshold** to `5` and the **Warning Threshold** to `3`.

  > **Note:** You should see the graph at the top of the page update as you adjust your query and thresholds to confirm you're setting up the correct monitor.

6. Under **Say what's happening**, provide this as a title:

  ```
  Storedog microsite experiencing high number of console errors.
  ```{{copy}}

  No need for body text if you won't want to, but make sure check the box that says `Include a sample of 10 logs in the alert notification`{{copy}} to help provide some context.

7. For **Notify your team**, you would usually put the Datadog users in your org or team that you want to be notified. In this case, since it's a training account, you can put your own email address in using `@email.address@yourorg.com` in the field.

8. Finally, click **Create** to create the monitor and you should be taken to the monitor's status page, where it will now take a few moments to gather data and start sending alerts.

While you wait, take a moment to discover some other ways to help identify trends and prioritize your work.

Click the **Continue** button to move on and learn how to use RUM Analytics to determine which service needs more attention in terms of performance.
