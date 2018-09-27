FROM nginx

ARG CONSUL_VERSION=0.19.5

RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O consul-template.tgz https://releases.hashicorp.com/consul-template/${CONSUL_VERSION}/consul-template_${CONSUL_VERSION}_linux_386.tgz && \
    tar -xzf consul-template.tgz && \
    mv consul-template /usr/bin/ && \
    consul-template --version

CMD nginx && consul-template -consul-addr "$CONSUL_HOST" -log-level "$CONSUL_LOG_LEVEL" -template "/etc/nginx/conf.d/default.conf.ctmpl:/etc/nginx/conf.d/default.conf:/usr/sbin/nginx -s reload"
