Since you've recently created a notebook, the next thing to learn is how to interact with it outside of Datadog with the API. You'll start by getting your notebook's data so you can see what data is returned.

> **Note**: You'll use cURL to interact with the API in this lab, but you can also use a Datadog client library. Check out the documentation for the <a href="https://docs.datadoghq.com/api/latest/notebooks" target="_datadog">Notebooks API</a> to learn more.

## Get All Notebooks

To interact with the Datadog API, you'll need to provide your API and application keys. Both of these have been saved as environment variables and can be viewed with the following command in your terminal:

```
echo $DD_API_KEY && echo $DD_APP_KEY
```{{execute}}

To get all of your organization's notebooks, run the following command:

```
curl -G \
  "https://api.datadoghq.com/api/v1/notebooks" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"
```{{execute}}

> **Tip:** Pipe your response to `jq` for more readable output.

In the response, you'll find a list of the notebooks you've created, complete with their IDs, names, and data about their cells. 

## Get a Single Notebook

To get the notebook you just created, you can use the `/api/v1/notebooks/:notebook_id` endpoint. First, you'll need to get the notebook's ID, which can be found in the response data, or in the URL of the notebook in Datadog.

Once you locate it, save it to an environment variable by running this command in the terminal to the right:

```
export NOTEBOOK_ID=<paste ID here>
```

Now run the following command to get a single notebook's data:

```
curl -G \
  "https://api.datadoghq.com/api/v1/notebooks/${NOTEBOOK_ID}" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" | jq
```{{execute}}

Take a moment or two to explore the data, specifically how the first and second cells are represented when compared to the third. The first two hold information specific to data captured by Datadog, while the third cell is a text cell created by the user that can be populated with Markdown content from any source.

> **Note:** A sample copy of the returned JSON data can be found in the **IDE** tab to your right.

Select the **Continue** button to move onto the next step, where you'll add release notes from a sample GitHub repository to your notebook through the API.
