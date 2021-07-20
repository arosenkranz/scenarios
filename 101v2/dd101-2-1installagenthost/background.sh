rm /usr/local/bin/prepenvironment
curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir -p /etc/datadog-agent
touch /etc/datadog-agent/empty
mkdir -p /root/lab
ln -s /etc/datadog-agent /root/lab/datadog-agent
# docker pull redis:6.0.11
# docker pull datadog/agent:7.25.1
statusupdate complete