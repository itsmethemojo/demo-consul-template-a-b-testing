# demo-consul-template-a-b-testing

start up the demo with [docker-compose](https://docs.docker.com/compose/install/)
```
docker-compose build; docker-compose up -d --force-recreate
```
now try to change the values in the [consul](http://localhost:8500/ui/dc1/kv)

use this script to see the impact of your changes
```
./test-distribution.sh
```
you can turn a group of by setting the value to 0

you can also reset all browser clients by changing the cookie prefix for your a b test
