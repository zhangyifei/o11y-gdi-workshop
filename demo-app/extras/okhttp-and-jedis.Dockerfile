FROM maven:3.6.3-jdk-11
COPY opentelemetry-java-tracing/okhttp-and-jedis/ /build
COPY ./runJava.sh /build
WORKDIR /build
RUN curl -k -o /opt/splunk-otel-javaagent.jar 'https://github.com/signalfx/splunk-otel-java/releases/download/v1.1.0/splunk-otel-javaagent-all.jar'
RUN mvn package
