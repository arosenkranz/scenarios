We will create a monitor alerting us whenever the `add_item` API endpoint responds in more than 400ms on average from our users' perspective.

1. Head to the [new monitor page](https://app.datadoghq.com/monitors?agg_metric=log_duration&agg_type=avg&query=%2540http.url_details.path%253A%2522%252Fapi%252Fv2%252Fstorefront%252Fcart%252Fadd_item%2522%2520%2540evt.category%253Aresource#create/rum). The query is already filled in. We measure the duration of this specific resource URL path.

2. In the alert conditions section, we set the alert treshold to `400000000`{{copy}} (400ms) for the last five minutes.

3. In the last section, enter a title for your monitor and a message containing your email address to receive a notification whenever the performance degrades.

Congratulations, you created your first monitor based off RUM data.