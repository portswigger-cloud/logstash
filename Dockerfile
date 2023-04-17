ARG logstash_version
FROM docker.elastic.co/logstash/logstash-oss:${logstash_version}
RUN bin/logstash-plugin install microsoft-sentinel-logstash-output-plugin
RUN bin/logstash-plugin install logstash-input-syslog
RUN rm -f /usr/share/logstash/pipeline/logstash.conf