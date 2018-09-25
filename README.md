# demo-consul-template-a-b-testing

```
docker-compose build; docker-compose up -d --force-recreate

 docker-compose exec nginx-consul-template bash

consul-template \
  -consul-addr "$CONSUL_HOST" \
  -log-level "$CONSUL_LOG_LEVEL" \
  -template "/etc/nginx/conf.d/default.conf.ctmpl:/etc/nginx/conf.d/default.conf:/usr/sbin/nginx -s reload"
```
