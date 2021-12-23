#!/bin/bash
while [ ! -f "/usr/local/bin/prepenvironment" ]; do
  sleep 0.3
done
sleep 0.3

waitfork8s

until kubectl apply -f k8s-yaml-files/lotsofpods.yaml
do
  kubeloopend=`date +%s`
  kubeloopruntime=$((kubeloopend-kubeloopstart))
  echo "kubectl isn't ready yet (lotsofpods)."
  echo "It has been $kubeloopruntime seconds"
  echo "If this doesn't resolve after 60 seconds, contact support."
  sleep 2
done

until kubectl apply -f k8s-yaml-files/datadog.yaml
do
  kubeloopend=`date +%s`
  kubeloopruntime=$((kubeloopend-kubeloopstart))
  echo "kubectl isn't ready yet (datadog)."
  echo "It has been $kubeloopruntime seconds"
  echo "If this doesn't resolve after 60 seconds, contact support."
  sleep 2
done
clear

prepenvironment
