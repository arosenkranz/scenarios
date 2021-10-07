With the application running and the Puppeteer service simulating some traffic to the e-commerce application and microsite, this is a good time to explore what is provided out of the box for you with RUM.

Navigate to the <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards List**</a> page and you'll find a list of dashboards provided to you by Datadog. Some of these out of the box dashboards are specifically designed to help you get a good overview of your Real User Monitoring data. These are all of the dashboards that start with **RUM** in the list. 

### User Sessions Dashboard

1. Start by navigating to the dashboard titled **RUM - User Sessions**. You'll be brought to a dashboard that looks like the following image:

  ![@TODO: RUM - User Sessions]()

2. On this page, you'll get a general overview of user session data throughout the time period set in the upper-right of the page. 

  To get a better view, update this time to be the last 30 minutes.

3. This dashboard provides overall statistics such as the number of users, the average session duration, and the average number of page views per session.

  As you navigate further down the page, you'll find more fine-tuned data about the demographics of the users, such as what browsers they use, what device they use, and where they are located.

4. Navigate even further down the page and you'll begin to see how these users are interacting with the application throughout the session.

  Seems like there may be an error or two coming in, which you'll dive into soon. 

> **Tip:** Use the Search tools at the top of the page to help filter the data by a number of different criteria.

### Mobile Dashboard

1. Using the <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards List**</a> page, navigate to the dashboard titled **RUM - Mobile**.

2. Explore the data in this dashboard and you'll find similar data to the one you saw in the previous dashboard, but this time it will be more specific to mobile devices.

3. Notice how this dashboard also collects errors and crash data towards the bottom of the page.

### Resources

1. Using the <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards List**</a> page, navigate to the dashboard titled **RUM - Resources**.

2. Use this dashboard to get a good look at how your application is utilizing different types of resources across different paths, locations, environment, or versions.

3. Look further down in the dashboard and you'll find a more detailed look at how long your application is taking to load, which is useful when trying to get a sense of performance issues when fetching these resources.

### Performance Overview Dashboard

1. From the <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards List**</a> page, navigate to the dashboard titled **RUM - Performance Overview**.

2. While the previous dashboard focused more on the resources needed to make the application work, this dashboard focuses on how the application's performance affects the user experience.

  You can see the application's Core Web Vital stats, how long it takes pages to load, how users interact with the application, and how long it takes for them to do so.

### Errors Dashboard

1. Finally, take a look at the <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards List**</a> page and navigate to the dashboard titled **RUM - Errors**.

2. This dashboard will give you an overview of how many errors and the types of errors that users have encountered during their sessions.

3. Take a moment and explore this dashboard, you may notice some errors are starting to come in from the Storedog microsite that may be worth looking into a bit more. 

When you're ready to move on, go ahead and click the **Continue** button below, where you'll use the RUM Explorer to identify and begin to investigate the errors that are coming in.

