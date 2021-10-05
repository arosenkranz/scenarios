As you just saw, RUM makes it easy to get a high-level view of your application's health and how it may be affecting users. This allows you to prioritize and address issues that may be impacting your application and its users.

Now you're going to use RUM to investigate a specific issue and see where it is failing in your application.

### Using the RUM Explorer

1. Navigate to the <a href="https://app.datadoghq.com/rum/explorer" target="_datadog">**RUM Explorer**</a> page.

  From this page, you can see information about user sessions, errors encountered, what pages were viewed, and other important information that allows you to understand what's going on in your application.

2. On the left-hand side, you'll find a list of facets you can use to help filter this data.
  
  If you explored either application earlier, you may even find your own session by toggling the **GEO > City** facet.

3. In the search box at the top of the page, remove any existing filters and search for data from the Storedog microsite with `Service:storedog-microsite`{{copy}}

  The result should be a list 