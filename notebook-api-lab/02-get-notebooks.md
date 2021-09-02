Using the Datadog API, you can interact with your organization's notebooks in a variety of ways. You may want to use it to get and save all of your notebooks to a GitHub repo, update a notebook with data collected from a third-party service, or even to create a new notebook. 

Since you've recently created a notebook, the next thing to learn is how to interact with it outside of Datadog. You'll start by getting your notebook's data so you can see what data is returned.

> **Note**: You'll use cURL commands to interact with the API in this lab, but you can also use a Datadog client library offered in your choice of programming language. Check out the documentation for the <a href="https://docs.datadoghq.com/api/latest/notebooks" target="_datadog">Notebooks API</a> to learn more.

## Get All Notebooks

To interact with the Datadog API, you'll need to provide your API key and application key. Both of these have been saved to your environment variables and can be viewed with the following command in your terminal:

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

In the response, you'll find a list of the notebooks you've created, complete with their IDs, names, and information about their cells. 

## Get a Single Notebook

For a more detailed and isolated look at a notebook's data, you can also use the `/api/v1/notebooks/:notebook_id` endpoint. First, you'll need to get the notebook's ID, which can be found in the response data, as this image shows:

![@TODO: Add image]()

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

Notice how each cell is represented. Most of the important content for each cell is under the `attribute` key, where you'll find information about the type of cell, its size, what content is to be displayed, and other data important to displaying the cell properly.

Take a moment or two to explore the data, specifically how the first and second cells are represented when compared to the third. The first two hold information specific to data captured by Datadog, while the third cell is a text cell created by the user that can be populated with Markdown content from any source.

> **Note:** Sample copies of the returned JSON data can be found in the **IDE** tab to your right.

Now that you have learned how to get a notebook and its data, you can begin to consider what other content and data you may want to add to it. 

Select the **Continue** button to move onto the next step, where you'll add release notes from a sample GitHub repository to your notebook through the API.
