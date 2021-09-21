1. The application we're going to monitor in this lab consists of services running on 10 containers across 7 Kubernetes pods. Make sure all the pods in your environment are running or at least being created:

    `kubectl get pods`{{execute}}.

2. Once all of the pods report 1/1 in the Ready column, log into the <a href="https://app.datadoghq.com" target="_datadog">Datadog application</a>. Click on Infrastructure > Containers to verify that metrics from the environment are coming in to the platform.

    To figure out which integrations are installed in this environment, run the Agent status command in the terminal using `kubectl exec $(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep datadog) -- agent status`{{execute}}. This command figures out which pod is running the Datadog Agent, and executes `agent status` on that pod.

3. The Datadog Agent enables APM trace metrics and allows non-local traffic by default, so we don't need to explicitly turn either one on. 

    > **Note:** If you ever need to disable APM or not allow non-local traffic, add the following environment variable settings into your configuration:
    > 
    > ```yaml
    > - name: DD_APM_ENABLED
    >   value: "false"
    > - name: DD_APM_NON_LOCAL_TRAFFIC
    >   value: "false"
    > ``` 

4. Open the application dashboard by clicking the tab titled "App Dashboard" in the terminal window to the right. Sometimes this takes a minute to be available upon opening, so be patient.

5. You can add a few pumps to the application by pressing the **Add Pump** button. To simulate usage, scroll down and click one of the **Generate API Traffic** buttons.

6. Navigate to <a href="https://app.datadoghq.com/apm/intro" target="_datadog">to the APM section</a> in the Datadog application. Because we haven't enabled traces from our application services yet, you'll see an introduction page. Click the **Get Started** button.

7. On the next page you will see the instructions for getting your traces into Datadog based on how your application is hosted and the types of services you want to trace. We'll skip this page for now, as the application is already configured, but keep this page in mind when you want to enable tracing in your own applications.

8. New menu options become available under APM in the nav bar when application traces are detected. Navigate to the <a href="https://app.datadoghq.com/apm/traces" target="_datadog">APM Trace List</a> and you should see traces start showing up. 

    If you still see the APM intro page, you may need to try the link again. Just refreshing the page will reload the APM intro page. Also make sure you clicked one of the Generate API traffic buttons, and that you ran the `kubectl apply -f k8s-yaml-files/datadog-agent.yaml`{{execute}} command if you made any changes to datadog-agent.yaml.
 