In the terminal on the right, the same environment from the previous activity is being prepared. You will see a message `Provisioning Complete` along with some login credentials when the environment is ready.

Since you already created a RUM application with a name of "Storedog", this lab has already fetched that information and the application is already running. So no need to manually build and start up the service this time.

1. Confirm the seven services are running by executing the following command in the terminal:

  ```
  docker ps
  ```{{execute}}

  > **Note:** If the containers aren't running, step into the working directory with `cd /root/lab`{{execute}} use `docker-compose down`{{execute}} and `docker-compose up -d`{{execute}} to restart them.

2. Make sure you are logged into your <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity. 

3. Navigate to the <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitors > New Monitor**</a> page and select the option to create a **Real User Monitoring** monitor.

4. Under **Define the search query**, select the button next to the input field that looks like `</>` to allow queries to be pasted in.
  
  Then filter down to the particular error you experienced earlier with the following query pasted in the input field:

  ```
  @type:error service:storedog-microsite @error.source:source env:frontend-workshop-2
  ```{{copy}}

  If the `frontend-workshop-2` environment doesn't show up, wait a moment or two and refresh the page, then reenter the query.

  > **Note:** The environment was set to `frontend-workshop-2` for this activity so any errors from the previous activity don't persist in this monitor.

5. For **Set Alert Conditions**, set the monitor to trigger when the metric is **Above** the threshold during the last **5 minutes**.

  Then set the **Alert Threshold** to `3` and the **Warning Threshold** to `1`. This will get you a result faster in this lab.

  > **Note:** You should see the graph at the top of the page update as you adjust your query and thresholds to confirm you're setting up the correct monitor.

6. For **Notify your team**, you would usually put the Datadog users in your org or team that you want to be notified. In this case, since it's a training account, you can put your own email address in using `@email.address@yourorg.com` in the field.

7. Under **Say what's happening**, provide this as a title:

  ```
  Storedog microsite experiencing high number of errors.
  ```{{copy}}

  No need for body text if you won't want to, but make sure check the box that says `Include a sample of 10 logs in the alert notification` to help provide some context.

8. Finally, click **Create** to create the monitor and you should be taken to the monitor's status page, where it will now take a few moments to gather data and start sending alerts.

While you wait, it's a good time to discover some other ways to help identify trends in your application and prioritize your work.

> **Note:** You can also create a monitor from the Error Tracking page that will allow you to receive alerts when any errors come in.

Click the **Continue** button to move on and learn how to use RUM Analytics to determine which service needs more attention in terms of performance.
