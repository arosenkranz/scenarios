In the terminal on the right, the Storedog app is being instrumented for APM with Datadog. Live traffic to the app is also being simulated. This may take up to 2 minutes. Once the app is running, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials.

Once the initialization completes, you can browse the Storedog app by clicking on the `storedog` tab in the terminal to the right. Throughout this lab, you will use a notebook to report on the frontend service of this application's health and correlate it with software release notes over the span of a week.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by the lab. If you need to recall your credentials, type `creds`{{execute}} in the terminal.

1. Navigate to the application's<a href="https://app.datadoghq.com/logs" target="_datadog">Logs</a> page to confirm logs are being captured. There isn't anything in particular you need to look for here, just confirm that the service `store-frontend` is being logged.

1. Next, navigate to <a href="https://app.datadoghq.com/notebook" target="_datadog">Notebooks > New Notebook</a> to create a new notebook.

1. Name the notebook `Frontend Service Weekly Report`, then set the time span to be `Past 1 Week` towards the top of the page.

1. When you started the new notebook, a cell was added with a sample timeseries graph to get you started. Find the dropdown menu titled `Timeseries`, then select the `Query` option. The result should look something like this image:

  ![](@TODO: insert image)

Create a new notebook, then walk through the different types of cells and how there’s Markdown support

Add cells that have to do with Storedog for the past week along with some written Markdown data

  Add timeseries of error statuses throughout the week for each service
  
  Add some markdown content

Now that a notebook is created, let’s see if you can retrieve it using the Datadog API
