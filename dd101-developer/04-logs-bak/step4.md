<a href="https://docs.datadoghq.com/logs/explorer/#transactions" target="_blank">Transaction</a> queries allow you to aggregate related log events into a single higher-level “transaction” event using a tag or an attribute from the logs. 

For each transaction event, the tag/attribute value and corresponding transaction duration, max severity, and event count are displayed. 

With transaction queries, you can visualize complex interconnected systems through log events, identify transaction bottlenecks by comparing durations, event counts, and custom measures, and reduce your Mean Time to Detect (MTTD) by isolating transactions with errors or high latencies.

Transactions aggregate indexed logs according to instances of a sequence of events, such as a user session or a request processed across multiple micro-services. 

1. In <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>, filter the list to the `service:advertisements-service`, `service:discounts-service`.

2. Select `Transactions` for **Group into** below the search field.

3. Group the transactions by service so that it reads **Group into** `Transactions` on `Service` and Count `all logs`.

  The Transactions list will display each service along with the the total count of logs.

  ![ads_discounts_transactions](querylogs/assets/ads_discounts_transactions.png)

4. Clear the search field above the Log List and enter `service:store-frontend`{{copy}}.

  Group the transactions by url path so that it reads **Group into** `Transactions` on `Status` and Count `all logs`.

  The Transactions list will display each status along with the total count of logs.

  ![frontend_status_transactions](querylogs/assets/frontend_status_transactions.png)

5. Click the X next to the **Group into** field to return to the Log List.

Great job learning about the different ways you can view and digest log data! Run the `finish`{{execute}} command to finish this activity and then click **Continue** below.
