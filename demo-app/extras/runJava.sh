#!/bin/bash

export OTEL_RESOURCE_ATTRIBUTES="service.name=my-sample-app"
curl -sSL -C - -o splunk-otel-javaagent-all.jar 'https://github.com/signalfx/splunk-otel-java/releases/latest/download/splunk-otel-javaagent-all.jar'

while true
do
    sleep 10
    echo 'Running the java client command'
    java  -javaagent:splunk-otel-javaagent-all.jar \
      -jar target/java-agent-example-1.0-SNAPSHOT-shaded.jar https://google.com
done

