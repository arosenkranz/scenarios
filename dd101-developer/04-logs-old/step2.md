With the <a href="https://docs.datadoghq.com/logs/explorer/#fields" target="_blank">Fields</a> aggregation, all logs matching the query filter are aggregated into groups based on the value of a log facet. For these groups, you can extract counts of logs per group, unique count of coded values for a facet per group, and statistical operations on numerical values of a facet per group.

1. In <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>, filter the list to the `service:advertisements-service`, `service:discounts-service`, `status:error`.

2. Select `Fields` for **Aggregate by** below the search field. A graph visualization of the filtered logs will replace the Log List.  

    Group the fields by service so that it reads **Aggregate by** `Fields` of `Service`.

    Above the graph, you'll see that **Timeseries** is selected. Select **Toplist** next to Timeseries, then select **Table** to view the different visualizations. Click **Timeseries** again.

    ![fields-agg](querylogs/assets/fields-agg.gif)

3. Click **Export** above the graph. You can export the visualization areas of the product, such as a Logs Monitor, to a dashboard, and to generate a log-based metric (<a href="https://docs.datadoghq.com/logs/logs_to_metrics/" target="_blank">Generate Metrics</a>). Click **Export** again to close the menu.

4. Click **Save** above the search field to save this view.

    Enter `Ads_Discounts_Errors_Timeseries`{{copy}} as the name of the **New View** and click **Save**. The new view will appear in the list. 

    Click the **Ads_Discounts_Errors** view. The view will change to the Log List you saved earlier. Click the **Ads_Discounts_Errors_Timeseries** view again. Click **Hide** to close the Saved Views panel.

5. Click the X next to **Fields** to return to the Log List.