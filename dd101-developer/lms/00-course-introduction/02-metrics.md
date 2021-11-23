
Datadog does the work of sorting these collected metrics into meaningful information, showing you the right content in the right context: 
Symptoms when you’re deciding whether whether to alert someone (or no one)
Diagnostics when that person is figuring out the right thing to do to fix or improve the situation.


Work metrics
Work metrics indicate the top-level health of your system by measuring its useful output, and can be broken into four main subtypes:

throughput is the amount of work the system is doing per unit time. Throughput is usually recorded as an absolute number.
success metrics represent the percentage of work that was executed successfully.
error metrics capture the number of erroneous results, usually expressed as a rate of errors per unit time or normalized by the throughput to yield errors per unit of work. Error metrics are often captured separately from success metrics when there are several potential sources of error, some of which are more serious or actionable than others.
performance metrics quantify how efficiently a component is doing its work. The most common performance metric is latency, which represents the time required to complete a unit of work. Latency can be expressed as an average or as a percentile, such as “99% of requests returned within 0.1s”.

These metrics are incredibly important for observability. They are the big, broad-stroke measures that can help you quickly answer the most pressing questions about a system’s internal health and performance: is the system available and actively doing what it was built to do? How fast is it producing work? What is the quality of that work?

Resource metrics
Most components of your software infrastructure serve as a resource to other systems. Some resources are low-level—for instance, a server’s resources include such physical components as CPU, memory, disks, and network interfaces. But a higher-level component, such as a database or a geolocation microservice, can also be considered a resource if another system requires that component to produce work.

Resource metrics can help you reconstruct a detailed picture of a system’s state, making them especially valuable for investigation and diagnosis of problems. For each resource in your system, try to collect metrics that cover four key areas:

utilization is the percentage of time that the resource is busy, or the percentage of the resource’s capacity that is in use.
saturation is a measure of the amount of requested work that the resource cannot yet service, often queued.
errors represent internal errors that may not be observable in the work the resource produces.
availability represents the percentage of time that the resource responded to requests. This metric is only well-defined for resources that can be actively and regularly checked for availability.

Events
In addition to metrics, which are collected more or less continuously, some monitoring systems can also capture events: discrete, infrequent occurrences that can provide crucial context for understanding what changed in your system’s behavior. Some examples:

Changes: Internal code releases, builds, and build failures
Alerts: Internally generated alerts or third-party notifications
Scaling events: Adding or subtracting hosts

An event usually carries enough information that it can be interpreted on its own, unlike a single metric data point, which is generally only meaningful in context. Events capture what happened, at a point in time, with optional additional information. For example:





