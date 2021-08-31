Using the Datadog API, you can interact with your organization's notebooks in a variety of ways. You may want to use it to get and save all of your notebooks to a GitHub repo, update a notebook with data collected from a third-party service, or even to create a new notebook. 

Since you've recently created a notebook, the next thing to learn is how to interact with it outside of Datadog. You'll start by getting your notebook's data so you can see what data is returned.

> **Note**: You'll use cURL commands to interact with the API in this lab, but you can also use a Datadog client library offered in your choice of programming language. Check out the documentation for the [Notebooks API](https://docs.datadoghq.com/api/latest/notebooks/) to learn more.

1. To interact with the Datadog API, you'll need to provide your API key and application key. Both of these have been saved to your environment variables and can be viewed with the following command in your terminal:

  ```bash
  echo $DD_API_KEY && echo $DD_APP_KEY
  ```{{exec}}

1. To get all of your organization's notebooks, run the following command:

  ```bash
  curl -G \
      "https://api.datadoghq.com/api/v1/notebooks" \
      -H "DD-API-KEY: ${DD_API_KEY}" \
      -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"
  ```{{execute}}

> **Tip:** Pipe your response to `jq` for more readable output.

In the response, you'll find a list of the notebooks you've created, complete with their IDs, names, and information about their cells.

Pull out the id of the notebook created in previous step and save it to environment variable

Run GET `/api/v1/notebooks/${NOTEBOOK_ID}` and pipe it to `jq` to get data for a single notebook, then walk through some of the returned data and explain how the cells are formatted

Now that you know how to access a single notebook’s data, you can now add to it with a PUT request
