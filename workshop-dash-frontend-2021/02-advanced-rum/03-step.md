In this step, you'll fix the bug in the code you discovered earlier. 

You're also going to enhance your own experience with RUM by configuring the codebase to set specific contextual data and user actions that can be more easily tracked throughout Datadog.

1. First, go ahead and fix the bug in the code by replacing the file with a fixed one using this command:

  ```
  cp /root/Advertisement.tsx /storedog-microsite/src/components/Advertisement.tsx
  ```{{execute}}

2. Open the **IDE** tab to the right and then open the `storedog-microsite/src/components/Advertisement.tsx`{{open}} file.

  On **line 41** you'll notice the extra `.jpg` extension has been removed.
  
3. Also notice on **line 50** the use of the following code:

  ```jsx
  datadogRum.addAction('Changed Ad', {
    advertisement: {
      id,
      name,
      url,
      path,
    },
  });
  ```

  This will send a custom action to Datadog that provides a more detailed view of the advertisement that was clicked, allowing you to identify any ads that have issues.

3. Next, you're going to set some global context data so all collected metrics will be associated with data you can use in Datadog.

  Replace the microsite's `index.tsx` file with the following command:

  ```
  cp /root/index.tsx /storedog-microsite/src/index.tsx
  ```{{execute}}

4. Open the **IDE** tab to the right and then open the `storedog-microsite/src/index.tsx`{{open}} file.

  You'll notice that below the RUM configuration from earlier, there's two new lines of code.

  The `setUser` method is setting the user's ID, name, email, and plan. This helps gain an understanding of what users are receiving errors.
  
  The `addRumGlobalContext` method is setting a global context value that can be used to identify users that come from the main Storedog site.

  > **Note:** Typically, you'd set the user data context data after the user logs in and authorizes their session.

5. Next, you're going to add some custom user actions to track how they are interacting with the discounts. Move an updated `DiscountList` component into the `src/components/` directory with this command:

  ```
  cp /root/DiscountList.tsx /storedog-microsite/src/components/DiscountList.tsx
  ```{{execute}}

6. Open the **IDE** tab to the right and then open the `storedog-microsite/src/components/DiscountList.tsx`{{open}} file to see the updated component.

  On **line 79** and **line 112**, you'll notice the use of `datadogRum.addAction`. This allows you to customize get a clearer picture of what the user is doing and how they are interacting with the discounts list.

7. Also notice in the `<th>` elements the use of `data-dd-action-name` attributes.

  These allow you to override the default action name displayed in Datadog so you could use more useful names to identify actions.

8. To see how it works, you'll need to rebuild the application. Do so by running the following command in the terminal:

  ```
  cd /storedog-microsite
  npm run build
  ```{{execute}}

  > **Note:** Usually, you'd want to run this command in a CI/CD pipeline and then upload the new sourcemaps, but for this workshop, you're going to run it locally.

9. There is no need to restart the Docker container, as the application's `build` folder is mounted as a volume, so the changes will be automatically picked up.

10. Click on the `microsite` tab to the right and click around on the microsite to make sure things are working correctly. Namely, make sure you click on the "Get New Ad" buttons by the banners, as they were the part that were broken earlier.

Once you've finished clicking around on the microsite, click the **Continue** button below to move on to the final step, where you'll see the results of the advanced RUM configuration you just put in place and confirm the monitor returns to an **OK** state.
