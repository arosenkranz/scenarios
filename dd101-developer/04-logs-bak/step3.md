Organizing large volumes of logs from different sources can be cumbersome. However, logs from a source usually have specific patterns. 

The <a href="https://docs.datadoghq.com/logs/explorer/#patterns" target="_blank">Patterns</a> aggregation can be surfaced automatically in the Log Explorer and are listed by number of logs with a service name, log status, and log message that matches a certain pattern. 

With pattern aggregation, logs that have a message with similar structures, belong to the same service and have the same status are grouped altogether. The patterns view is helpful for detecting and filtering noisy error patterns that could cause you to miss other issues.

1. In <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>, filter the list to the `service:advertisements-service`, `service:discounts-service`.

2. Select `Patterns` for **Group by** below the search field.

  Observe the differences in the patterns that are listed.

3. Click one of the patterns to open the details side panel. The pattern and a list of Events Samples are displayed.

  ![patterns](querylogs/assets/patterns.png)

4. In the upper-right above the Pattern, click **Show Parsing Rule**. 

  If you want to create a custom <a href="https://docs.datadoghq.com/logs/explorer/#patterns" target="_blank">pipeline</a> for this service/source, you can copy and paste this rule into a <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> on the <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration**</a> page.

    ![grokparser-parsingrule](querylogs/assets/grokparser-parsingrule.png)

    Close the side panel.

5. Click the X next to **Patterns** to return to the Log List.
