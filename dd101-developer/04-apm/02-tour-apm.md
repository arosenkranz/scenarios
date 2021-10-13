Now that the Agent is collecting traces from the discounts service, take a look at those traces in the Datadog App.

1. Navigate to **APM > Services**. You'll see the `discounts-service` that you just enabled. You'll also see `postgres`, which doesn't communicate with the Datadog Agent directly.

    ![Discounts and postgres in APM services](./assets/discounts_apm_services.png)

    `postgres` shows up because `discounts-service` traces capture it. You configured the PostgreSQL integration in the previous lab, but it doesn't send traces to the Datadog Agent. Applications that *connect* to the database do.

1. Click on **discounts-service** and scroll down to **Endpoints**. Here you will see all of the service's application endpoints that APM traced. This service has one endpoint, `GET /discount`

    ![Discounts service endpoints](./assets/discounts_apm_services_endpoints.png)

1. Navigate to **APM > Traces**. Here you see a live stream of the traces APM has captured over the past 15 minutes.

    ![Discounts APM traces](./assets/discounts_apm_traces.png)

    Scroll down and click on an older `discounts-service` trace. This flamegraph displays the time spent in each service for this trace. 

    ![Discounts APM trace flamegraph](./assets/discounts_apm_traces_flamegraph.png)

1. Click the **Logs** tab at the bottom of the trace details panel. These are the related log lines captured during the trace's timeframe.

    ![Discounts APM trace detail log tab](./assets/discounts_apm_traces_logs_tab.png)

    Mouse over each line and look at the flamegraph. You'll see a horizontal line marking the exact point in the trace that the log line was emitted. This is enabled by the `DD_LOGS_INJECTION` configuration.

1. Click on a log line from `discounts.py`. This takes you to a detailed view in the line in the Logs Explorer.

    ![Discounts trace to log line](./assets/discounts_trace_to_logline.png)

1. Close the log detail and notice that the search field is filtering logs by the specific ID of the trace. 

    Clear the search field and change the timeframe to `Past 15 Minutes` to view all logs.

    Click on the `discounts-service` facet on the left to see only those from the `discounts-service`

1. Click on a `discounts-service` log line for `discounts.py`.

    Click on the **Trace** tab.

    ![Traces in logs](./assets/discounts_apm_traces_in_logs.png)

    Here is the trace for this log line right in the log details view!

1. Click on **View Trace Details** to view the trace in the APM trace details page. 

You can now travel back and forth between between APM traces and logs for the discounts service.  

Click the **Continue** button to enable traces for all of the Storedog services.