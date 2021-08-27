Using the API, you can update an existing notebook to either add or overwrite data. This is useful when you want to take data returned from a third party API like GitHub repo releases and add it to a notebook so it all lives within the Datadog app

Blockquote - Note: Explain that you can create a notebook with a POST request, but that notebook will be associated with the org’s admin. Instead, you’ll update the notebook you personally created and retrieved data from in the previous step

For this lab, the JSON data will be provided for you in a way that it already works with the Datadog API, but typically you’ll want to reformat the data so it works better with the notebook’s format.

Display sample JSON body data for PUT request and point out how you can still use Markdown formatting

Run PUT `/api/v1/notebooks/${NOTEBOOK_ID}` with request body content provided and point out what’s returned in successful response

Open Datadog and refresh the notebook to see it appear there, reiterate that this is a good way of getting a more holistic view of your application’s health and how activity over the past week may have impacted it

Reminder that you can write this all into a script that generates weekly reports

Now that this is all set up, let’s look at how you can share and save your notebooks
