In the terminal on the right, the Storedog app is being instrumented for APM with Datadog. Live traffic to the app is also being simulated. This may take up to 2 minutes. Once the app is running, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials.

Once the initialization completes, you can browse the Storedog app by clicking on the `storedog` tab in the terminal to the right. Throughout this lab, you will use a notebook to report on the frontend service of this application's health and correlate it with software release notes over the span of a week.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by the lab. If you need to recall your credentials, type `creds`{{execute}} in the terminal.

1. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">application's Logs page</a> to confirm logs are being captured. There isn't anything in particular you need to look for here, just confirm that the service `store-frontend` is being logged.

1. Next, navigate to <a href="https://app.datadoghq.com/notebook" target="_datadog">Notebooks > New Notebook</a> to create a new notebook.

1. Name the notebook `Frontend Service - Weekly Report`, then set the time span to be `Past 1 Week` towards the top of the page.

1. When you started the new notebook, a cell was added with a sample timeseries graph to get you started. 

  First, give it a name of `Avg Request Duration` in the input box at the top of the cell. Then find the dropdown menu titled `Timeseries`, then select the `Query` option. It should look something like this image:

  ![](@TODO: insert image)

1. Now set it up so the cell's is set to query `Metrics` with a value of `trace.rack.request.duration` from `env:my-environment, service:store-frontend`{{copy}}. The result should be the duration displayed in the cell, resembling this image:

  ![](@TODO: insert image)

  > **Note:** The `env:my-environment` and `service:store-frontend` facets were created for you when the application was instrumented and can be found in the `docker-compose.yml` file in the IDE tab.

  Notice how the time seems a bit slower than expected? This is because it is calculating an average based off the week's data, but metrics have only been collected for a few minutes so far.

1. Go ahead and save the cell, either by selecting the cell's `Done` button or clicking anywhere outside of the cell.

1. Now create another cell below the one you just created. This time, make it a Timeseries cell with a name of `Logs`.

1. For this cells query, set it to query `Logs` with a value of `Service:store-frontend`{{copy}} and set the "group by" option to be `Status(status)`{{copy}}`.

  The result should be a line graph of the status of the application broken out by status. To make it more readable, set the "Display" option to be `Bars`, resulting in something that looks like the following image:

  ![](@TODO: insert image)

1. Save the cell, then create one more below it. This time, create a "Text" cell with the following Markdown content and save it:

  ```md
  ## Release Notes
  ```{{copy}}

1. Now save the notebook by selecting the `Save Notebook` button on the page.

With your notebook created and set up to pull a report of the frontend service's health, you can now move on to the next step, where you'll learn how to query a notebook's data using the Datadog API.
