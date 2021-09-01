So far, you've created a notebook that provides insight to an application's health and performance over the course of a week, but that may not be enough to provide a full picture of what actually happened throughout the week. For some, it may be helpful to correlate an application's performance with other data, such as PagerDuty incidents or Jira tickets closed related to the application. 

With the Datadog API, you can do just that. In this step, you'll update your notebook with release notes for the week from the application's repository. This data can be sourced from the GitHub API or a similar service that's hosting your codebase, sanitized and transformed into a format that's easy to consume, and added as a cell to your notebook.

## Get Release Notes Data from GitHub

To start, take a moment and examine the release note data returned for a repository when using the GitHub API. Use the following example as a guide, but feel free to change the values to match your own repository:

```
curl -G \
  "https://api.github.com/repos/datadog/datadog-agent/releases?per_page=5" | jq
```{{execute}}

Notice in the response data how you can see all of the information associated with each release? This includes the author of the release, its name, what date it was created, and the release notes stored in the body. Use the following image as a reference:

![](@TODO: Add image)

Usually, you'll need to do a little finessing to get the data into a format that you want. In a case like this, where you want to only get notes from the previous week, you'd need to identify all of the releases that were created within that time frame and then compile a list of the release notes from each of those releases.

Another thing to be mindful of is how the release notes stored in the `body` field are formatted in the first place. Sometimes they're formatted as Markdown, sometimes they're formatted as rich text with emojis. You'll want to make sure you're getting the data in the format that serves you best for your notebook.

> **Note:** For this lab, the JSON data will be provided to you in a way that is already formatted and valid for the Datadog API.
>
> To get a better understanding of what is expected by the API to update a notebook, check out the [Datadog Notebook API documentation](https://docs.datadoghq.com/api/latest/notebooks/#update-a-notebook).

## Update Notebook with Release Notes

Now that you've seen the type of data returned by the GitHub API, you may have a better understanding of what parts of it you'd want to include in your notebook. 

Keep in mind that updating a Datadog notebook is a complete overwrite using a PUT request method, so the data you retrieved from the GET request in the previous step will still need to be part of the request body if you want to keep your notebook's existing data intact.

In the **IDE** tab, open the `update_notebook.sh`{{open}} file and you'll find a script for updating your notebook, complete with the request body already formatted. 

The first two cells are in place and to keep the notebook's existing data intact, and resemble the data returned earlier from the GET request you ran. The third cell has been updated to include the date from 7 days ago, to help you identify which week you're looking at.

A fourth cell has been added to include the release notes data from the GitHub API. They are grouped by the type of change made and also include links to the relevant GitHub issue or pull request. For this lab, however, all of the links will not go anywhere.

Go ahead and run this script in the terminal to update the notebook:

```
bash update_notebook.sh
```{{execute}}

The response should be the updated notebook's content, much like the response you received from the GET request earlier. Go ahead and check out your updated notebook in the [Datadog app](https://app.datadoghq.com/notebooks), it should resemble something like this image:

![](@TODO: Add image)

Great work! Now you can see what work was done in the previous week and how it impacted the application's health and performance, all in one place. This gives you and your team a more holistic view of your application and if the work being performed is being done effectively.

While the script provided in the `update_notebook.sh` file is a good starting point to see what's possible, you may want to consider how you can make it more flexible and customized to you and your team's needs. With the Datadog API, you can write scripts much like this one in your preferred language that automates report generation for you.

With your notebook all set up, you can now move onto the next and final step, where you'll learn what options are available for you to share your notebook with teammates and stakeholders.
