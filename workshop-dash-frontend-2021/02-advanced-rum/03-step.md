In this last step, you'll fix the bug in the code you discovered earlier. You're also going to enhance your own experience with RUM by configuring the codebase to set specific contextual data and user actions that can be more easily tracked throughout Datadog.

1. First, go ahead and fix the bug in the code by replacing the file with a fixed one using this command:

  ```
  mv /root/Advertisement.tsx /storedog-microsite/src/components/Advertisement.tsx
  ```{{execute}}

2. Open the **IDE** tab to the right and then open the `storedog-microsite/src/components/Advertisement.tsx`{{open}} file.

  Find the line in the `handleUserGetAd` function that had the error and you'll notice the extra `.jpg` extension has been removed and the `fetch` request looks like this:

  ```jsx
  const bannerAdRes = await fetch(
      `${process.env.REACT_APP_DD_ADS_URL}/banners/${path}`
    );
  ``` 

3. Next, you're going to set some global context data so all collected metrics will be associated with data you can use in Datadog.

  Replace the microsite's `index.tsx` file with the following command:

  ```
  mv /root/index.tsx /storedog-microsite/src/index.tsx
  ```{{execute}}

4. Open the **IDE** tab to the right and then open the `storedog-microsite/src/index.tsx`{{open}} file.

  You'll notice that below the RUM configuration from earlier, there's two new lines:

  ```jsx
  // set context for the user
  datadogRum.setUser({
    id: '1234',
    name: 'John Doe',
    email: 'john.doe@storedog.com',
    plan: 'premium',
  });

  // if coming from main storedog website, set a global context value
  if (window.location.search.includes('storedog')) {
    datadogRum.addRumGlobalContext('fromStoredog', true);
  }
  ```

  First, you'll notice that the `setUser` function is setting the user's ID, name, email, and plan. This helps gain an understanding of what users are receiving errors.
  
  The `addRumGlobalContext` function is setting a global context value that can be used to identify users that come from the main Storedog site.

  > **Note:** Typically, you'd set the user data context data after the user logs in and authorizes their session.

5. Next, you're going to add some custom user actions to track how they are interacting with the discounts. Move an updated `DiscountList` component into the `src/components/` directory with this command:

  ```
  mv /root/DiscountList.tsx /store-microsite/src/components/DiscountList.tsx
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

  Go back to the **RUM Explorer** page and wait a few moments, perhaps even update the time span to be for the past 5 minutes to see fresher data. You should that users are no longer having the issue!