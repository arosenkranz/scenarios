The monitor you just created will take a moment or two before it's sending alerts, so it's a good opportunity to take some time to think about other issues your application may have.

Here, you'll take a look at the **RUM Analytics** to identify performance issues between your frontend and microsite services to help prioritize where time should be spent. Then you'll revisit the monitor to see if it's sending an alert.

1. Navigate to the <a href="https://app.datadoghq.com/rum/analytics" target="_datadog">**UX Monitoring > Analytics**</a> page and you'll be able to see how your application's are performing at a higher level.

  Rather than diving into individual user sessions, you can use this tool to track trends in your services and how they respond to both user input and their interactions with other services and APIs.

2. For now, take a look at the Largest Contentful Paint (LCP) metrics for the Storedog frontend and microsite services. Having a high LCP can lead to a poor user experience and ultimately will cause users to drop the session, so it's important to keep an eye on these metrics and not just errors experienced by users.

  Set the filter bar at the top of the page to filter by `@view.url_path:"/"`{{copy}}, this way we can compare how both services' home pages are performing.
  
  Then set the **Measure** value to `Largest Contentful Paint` (or `@view.largest_contentful_paint`{{copy}}) and **avg by** a value of `Service (service)`.

  Finally, update the **Time Range** option to have a value of `Top List` instead. This will give you a clear breakdown of which service has a worse LCP at the moment.

  The result should look something like this:

  ![@TODO: add screenshot]()

3. The **store-frontend** service seems to be experiencing a poor LCP metric, so it's safe to say this is where you may want to focus on next for performance improvements.

  Click on the service name to and then select **View events** from the menu. Then select one of the events to see how it performed. It should look something like this image:

  ![@TODO: add screenshot]()

4. Navigate through the list and you'll notice it takes a lot of the scripts around 3 seconds to load, and then the ads and discounts take about another 3 seconds to load after that. 

  This is a big performance issue that needs to be addressed, perhaps even by different teams, depending who manages the ads and discounts services. The good news is you've identified both the issue and what the potential next steps are.

Navigate back to the monitor you created earlier from the <a href="https://app.datadoghq.com/monitors/manage" target="_datadog">**Monitors > Manage Monitors**</a> page and you'll find that it's starting to send an alert, as the next image shows:

  ![@TODO: add screenshot]()

In the next and final step, you'll fix the error so you can witness the monitor return back to an **OK** status. While you're at it, you'll also add some custom data to the microsite's user events so you can capture more meaningful information about each user's session.

> **Note:** Another very important tool at your disposal is <a href="https://app.datadoghq.com/rum/error-tracking" target="_datadog">**Datadog Error Tracking**</a>. It uses machine learning to identify trends in errors and helps collect them in a way that's easy to understand and act upon. It takes some time for it to start working, so unfortunately it is unavailable in this workshop.

Click the **Continue** button below to move on.
