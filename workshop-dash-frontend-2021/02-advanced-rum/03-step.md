In this last step, you'll fix the bug in the code you discovered earlier. You're also going to enhance your own experience with RUM by configuring the codebase to set specific contextual data and user actions that can be more easily tracked throughout Datadog.

1. First, go ahead and fix the bug in the code by replacing the file with a fixed one using this command:

  ```
  mv /root/Advertisement.tsx /storedog-microsite/src/components/Advertisement.tsx
  ```{{execute}}

2. Open the **IDE** tab to the right and then open the `storedog-microsite/src/components/Advertisement.tsx`{{open}} file.

  Find the line in the `handleUserGetAd` function that had the error and you'll notice the extra `.jpg` extension has been removed.
  
3. Also notice the use of the following code:

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
  mv /root/index.tsx /storedog-microsite/src/index.tsx
  ```{{execute}}

4. Open the **IDE** tab to the right and then open the `storedog-microsite/src/index.tsx`{{open}} file.

  You'll notice that below the RUM configuration from earlier, there's two new lines of code.

  The `setUser` method is setting the user's ID, name, email, and plan. This helps gain an understanding of what users are receiving errors.
  
  The `addRumGlobalContext` method is setting a global context value that can be used to identify users that come from the main Storedog site.

  > **Note:** Typically, you'd set the user data context data after the user logs in and authorizes their session.

5. Next, you're going to add some custom user actions to track how they are interacting with the discounts. Move an updated `DiscountList` component into the `src/components/` directory with this command:

  ```
  mv /root/DiscountList.tsx /storedog-microsite/src/components/DiscountList.tsx
  ```{{execute}}

6. Open the **IDE** tab to the right and then open the `storedog-microsite/src/components/DiscountList.tsx`{{open}} file to see the updated component.

  In **Line 77** and **Line 110**, you'll notice the use of `datadogRum.addAction`. This allows you to customize get a clearer picture of what the user is doing and how they are interacting with the discounts list.

7. To see how it works, you'll need to rebuild the application. Do so by running the following command in the terminal:

  ```
  cd /storedog-microsite
  npm run build
  ```{{execute}}

  > **Note:** Usually, you'd want to run this command in a CI/CD pipeline and then upload the new sourcemaps, but for this workshop, you're going to run it locally.

11. There is no need to restart the Docker container, as the application's `build` folder is mounted as a volume, so the changes will be automatically picked up.

12. It'll take the monitor a bit to exit its **Alert** state, so while you wait, head back to the RUM Explorer in Datadog and watch the session data coming in for the `store-microsite` service. 

13. After a few moments, you'll see that users are no longer encountering the errors from before. Open up a session and you'll see that the user can now change the ads without any issues.

  ![@TODO: Add screenshot]()

14. Note 