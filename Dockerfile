# Pull base image.
FROM sebp/elk:latest

ADD ./03-tcp-input.conf /etc/logstash/conf.d/03-tcp-input.conf
ADD ./30-output.conf /etc/logstash/conf.d/30-output.conf

WORKDIR ${KIBANA_HOME}
RUN gosu kibana bin/kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/0.1.11/logtrail-5.4.0-0.1.11.zip
COPY ./logtrail.json /opt/kibana/plugins/logtrail/logtrail.json

EXPOSE 4560
