You'll notice in the terminal that there is a script running. This script will fetch and prepare your environment for the lab. 

Part of that preparation is provisioning a temporary account for the Datadog application that you'll use throughout the rest of your labs. Let's confirm that it works!

> **Note:** These accounts are temporary and to be used for 14 days. After that, you will be provisioned a new account.

1. Take a look at the terminal and wait until the startup script finishes. The resulting screen should list your account credentials and how much time is left on the account, resembling this image:

    ![](./assets/lab-startup.png)

1. In case you need to retrieve your credentials, you can print them to the terminal with the following command:

 `creds`{{execute}}

1. Now login to your <a href="https://app.datadoghq.com" target="_datadog">Datadog account</a> with your provisioned credentials.

1. Let's verify that you are in the right organization. Visit <a href="https://app.datadoghq.com/account/settings#api" target="_datadog">the API Keys section</a>, which you can find in the Global Navigation under **Integrations > APIs**. Expand API Keys and hover over the purple rectangle to reveal the API key we have created for you.

1. In the Training Lab terminal, run the command `echo $DD_API_KEY`{{execute}} to see the API key environment variable. Verify that this is the same API key. You don't have to memorize the entire key. Just making sure that the first and last couple of characters are the same should be good enough to ensure a match.  

    > **Note:** API and Application keys are different.

    If this is not the same API key that you saw in your Datadog account, you may have been in the wrong organization. You can switch organizations by clicking on the Account menu in the Datadog nav bar and selecting the new organization we created for you.

    
1. At the end of every section of this course, including this one, run `grademe`{{execute}} when you are finished. Go for it. Run it now.
