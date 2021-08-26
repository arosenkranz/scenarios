In the terminal on the right, the Storedog app is being instrumented for APM with Datadog. Live traffic to the app is also being simulated. This may take up to 2 minutes. Once the app is running, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials.

Once the initialization completes, you can browse the Storedog app by clicking on the `storedog` tab in the terminal to the right. Throughout this lab, you will use a notebook to report on this multi-service application's health compared to software release notes over the span of a week.

To start, you'll log into Datadog and confirm that logs are being captured.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by the lab. If you need to recall your credentials, type `creds`{{execute}} in the terminal.

1. Navigate to the <a href="https://app.datadoghq.com/dashboard/organization" target="_datadog">Dashboard</a> for your.

Create a new notebook, then walk through the different types of cells and how there’s Markdown support

Add cells that have to do with Storedog for the past week along with some written Markdown data

  Add timeseries of error statuses throughout the week for each service
  
  Add some markdown content

Now that a notebook is created, let’s see if you can retrieve it using the Datadog API
