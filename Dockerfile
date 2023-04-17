FROM docker.elastic.co/logstash/logstash-oss:8.7.0
RUN bin/logstash-plugin install microsoft-sentinel-logstash-output-plugin
RUN bin/logstash-plugin install logstash-input-syslog
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
COPY --chown=logstash:root pipeline/ /usr/share/logstash/pipeline/
COPY --chown=logstash:root config/ /usr/share/logstash/config/