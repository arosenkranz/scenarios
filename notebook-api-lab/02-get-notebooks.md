With the Notebook created, you can retrieve it via the Datadog API. Do that now so you can study how the data is returned to you.

Add link to the Notebook API documentation for reference

You need to use your account’s API and APP keys, which were set as environment variables when the lab started

Run GET `/api/v1/notebooks` in terminal and point out response data

Blockquote - Tip: Pipe response to `jq` to pretty print it

Pull out the id of the notebook created in previous step and save it to environment variable

Run GET `/api/v1/notebooks/${NOTEBOOK_ID}` and pipe it to `jq` to get data for a single notebook, then walk through some of the returned data and explain how the cells are formatted

Now that you know how to access a single notebook’s data, you can now add to it with a PUT request
