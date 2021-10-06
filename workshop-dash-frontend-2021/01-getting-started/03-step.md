As you just saw, RUM makes it easy to get a high-level view of your application's health and how it may be affecting users. This allows you to prioritize and address issues that may be impacting your application and its users.

Now you're going to use the RUM Explorer and Session Replay to investigate a specific issue and see where it is failing in your application. 

1. Navigate to the <a href="https://app.datadoghq.com/rum/explorer" target="_datadog">**RUM Explorer**</a> page.

  From this page, you can see information about user sessions, errors encountered, what pages were viewed, and other important information that allows you to understand what's going on in your application.

2. On the left-hand side, you'll find a list of facets you can use to help filter this data.
  
  If you explored either application earlier, you may even find your own session by toggling the **GEO > City** facet.

3. In the search box at the top of the page, remove any existing filters and search for data from the Storedog microsite with `Service:storedog-microsite`{{copy}}

4. Click on one of the sessions that has an error, which you can find in the **Error Count** column.

  Here, you can see exactly what path the user took in the application and when the error occurred throughout their session.

  In this menu, you can also view only the errors or the attributes of the user that had the errors, which makes it easier to see if the issue is specific to a user's environment or location.

5. Another feature is **Session Replay**, which was turned on when we instrumented the applications earlier. Select that button now.

  This feature allows you to watch back the user's session and see what actions were taken that led them to the error.

  Watch the video and you'll notice the error occurred after the user selected the "Get New Ad" button on the site. 

6. On the right-hand side, find one of the user actions that says **Click on Get New Ad**. Hover over it and click on the **Details** icon on it to get a deeper view of the action that led to an error.

  You'll find a number of options for how to view the action, such as what resources were requested, the error message, and the stack trace.

  Look deep enough and you'll notice that the request was made to a banner endpoint with two `.jpg` extensions. Now that you have an idea of what the problem is, see if you can find where it happened.

7. Click on the error and you'll get a detailed view of where the error occurs in the source code.

  Because you uploaded the source maps with the `datadog-ci` tool earlier, Datadog can show you the line in the application's source code that caused the error. Without it, you would be shown where the error occurred in the minified JavaScript, which is not very helpful.

  Since the source maps were uploaded within the context of a GitHub repository, Datadog will provide a link to the repo so you can quickly file an issue and fix the error.

8. Notice in the source code that there's an extra `.jpg` extension on the end of the URL: 

  ```jsx
  const bannerAdRes = await fetch(
        `${process.env.REACT_APP_DD_ADS_URL}/banners/${path}.jpg`
      );
  ```

  The `path` already has a `.jpg` extension, so you don't need to have the second one. Now that you know where it happened, you will have a much easier time fixing it!

9. Open the **IDE** tab and then open the `storedog-microsite/src/components/Advertisement.tsx`{{open}} file.

  Find the line that has the error and remove the `.jpg` extension so the `fetch` request looks like this:

  ```jsx
  const bannerAdRes = await fetch(
        `${process.env.REACT_APP_DD_ADS_URL}/banners/${path}`
      );
  ``` 

10. The file will save by itself, so now you can rebuild the application and see if that fixes the error.

  Do so by running the following command in the terminal:

  ```
  cd /storedog-microsite
  REACT_APP_DD_APPLICATION_ID=$DD_APPLICATION_ID REACT_APP_DD_CLIENT_TOKEN=$DD_CLIENT_TOKEN npm run build
  ```{{execute}}

  > **Note:** Usually, you'd want to run this command in a CI/CD pipeline and then upload the new sourcemaps, but for this tutorial, we're just going to run it locally and see if it fixes the error.

11. There is no need to restart the Docker container, as the application's `build` folder is mounted as a volume, so the changes will be automatically picked up.

  Go back to the **RUM Explorer** page and wait a few moments, perhaps even update the time span to be for the past 5 minutes to see fresher data. You should that users are no longer having the issue!

Great work using RUM to identify, diagnose, and fix issues in your application. With RUM dashboards, the Explorer, and Session Replay, you have the ability to see what's going on in your application and how it may be affecting users.

Click **Continue** below to finish this first part of the workshop.
