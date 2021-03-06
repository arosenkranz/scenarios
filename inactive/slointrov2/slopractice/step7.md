The <a href="https://docs.datadoghq.com/dashboards/widgets/slo/" target="_blank">SLO Summary widget</a> allows you to track your SLOs alongside other data in <a href="https://docs.datadoghq.com/dashboards/" target="_blank">Dashboards. 

1. Navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards**</a> and click **New Dashboard**.

2. Enter the Dashboard name `Storedog App SLOs` and select **New Dashboard**.

3. Click **Add Widgets** next to the dashboard title if the widget options are not displayed.

4. Click and drag the **SLO Summary** widget to the board. The SLO Summary Editor window will pop up.

5. Under **Search and select SLO**, select the Monitor-based SLO you created `Home Page P99 Latency`.

6. Under **Set Time Windows**, notice that `7 Days` is automatically selected for the **Rolling Time Windows** because the SLO time window is for the past 7 days. 

   Select `Week to date` and `Previous week` below **Calendar Time Windows**.

7. Under **Set display preferences**, make sure **Show error budget** is selected.

8. Under **Widget title**, you can leave the title as is or modify as desired.

9. Click **Done**.

   ![slo-widget-monitorbased](./assets/slo-widget-monitorbased-2.png)

10. Repeat steps 3 to 9 for the Metric-based SLO you created.

   Under **Set Time Windows**, notice that `30 Days` is automatically selected for the **Rolling Time Windows** because the SLO time window is for the past 30 days. 

   Select `Month to date` and `Previous month` below **Calendar Time Windows**.

   ![slo-widget-metricbased](./assets/slo-widget-metricbased-2.png)

   Let's also add two separate Monitor Summary widgets: one for monitors used in Monitor-based SLOs and one for Error Budget Monitors.

11. In the Widget Bar, find the widget titled **Monitor Summary**.

12. Click and drag the **Monitor Summary** widget to the board. The Monitor Summary Edtior window will pop up.

13. Under **Select summary type**, select **Monitor**.

14. Under **Search for monitors to summarize**, enter `tag:(env:ruby-shop) type:apm`{{copy}} to list all monitors created for the Storedog app.

15. Leave the **Set display preferences** as is.

16. Under **Widget title**, enter the title `Monitors for Monitor-based SLOs`{{copy}}.

17. Click **Save**.

    ![monitor-widget-monitorsforslos](./assets/monitor-widget-monitorsforslos.png)

18. Repeat steps 11 to 17 for the Error Budget Monitor you created. 

    To search for the monitor, enter `tag:(env:ruby-shop) type:slo`{{copy}}.

    Enter the title `Error Budget Monitors for SLOs`{{copy}}.

    ![monitor-widget-errorbudgets](./assets/monitor-widget-errorbudgets.png)

19. Rearrange and resize the widgets on the boards as desired.

Now that you've created the dashboard for the SLOs and their related monitors, let's see what happens to the SLOs and their error budgets when the app has errors. 
