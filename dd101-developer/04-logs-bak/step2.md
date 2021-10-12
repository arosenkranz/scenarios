With the <a href="https://docs.datadoghq.com/logs/explorer/#fields" target="_blank">Fields</a> aggregation, all logs matching the query filter are aggregated into groups based on the value of a log facet. For these groups, you can extract counts of logs per group, unique count of coded values for a facet per group, and statistical operations on numerical values of a facet per group.

1. In <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>, filter the list to the `service:advertisements-service`, `service:discounts-service`, `status:error`.

2. Select `Fields` for **Group into** below the search field. A graph visualization of the filtered logs will replace the Log List.  

3. Group the fields by service so that it reads **Group into** `Fields` by `Service`.

4. Above the graph, you'll see that **Timeseries** is selected. Select **Toplist** next to Timeseries.

  ![fields-agg](querylogs/assets/fields-agg.gif)

5. If you want to save this view for later, click **Save** above the search field.

6. Enter `Ads_Discounts_Errors_Timeseries`{{copy}} as the name of the **New View** and click **Save**. The new view will appear in the list. 

7. Click the X next to **Fields** to return to the Log List.
