# Configure the Agent Using Docker

The Datadog Agent is a piece of software that runs on your hosts. 
It collects events, logs, and metrics from hosts and sends them to Datadog.
It’s open source
Highly configurable using the datadog.yaml or environment variables
We provide binaries for many architectures and operating systems, and instructions on installing and configuring each


Datadog supports the Agent on various kinds hosts and also on several container types. Configuration is slightly different depending on the host or container type, but for the purposes of this workshop, we are going to focus on the very popular use case of installing the Agent into a Docker container.

The Agent container reads /proc and /sys/fs/cgroup on the host, and queries the Docker Daemon using /var/run/docker.sock
The Agent itself is configured by environment variables (not YAML files)
It reads labels on other containers to know how to collect metrics from them
