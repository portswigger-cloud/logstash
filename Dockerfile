FROM docker.elastic.co/logstash/logstash-oss:8.7.0
RUN bin/logstash-plugin install microsoft-sentinel-logstash-output-plugin
RUN bin/logstash-plugin install logstash-input-syslog