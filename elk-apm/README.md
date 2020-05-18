# ElasticSearch + Logstash + Kibana + ElasticAPM
`ELK Stack` and` ElasticAPM` are free versions and you can check the license policy at [Elastic homepage](https://www.elastic.co/subscriptions).

`ElasticAPM` has been included in the Elastic base bundle since version 6.3.

Elastic product download can be downloaded from the link below.
* [ElasticSearch](https://www.elastic.co/kr/downloads/elasticsearch)
* [Logstash](https://www.elastic.co/kr/downloads/logstash)
* [Kibana](https://www.elastic.co/kr/downloads/kibana)
* [ElasticAPM](https://www.elastic.co/kr/downloads/apm)

## ElasticSearch
Install
```
tar -xvzf elasticsearch.tar.gz
cd /elasticsearch
```

Start
```shell script
/bin/elasticsearch
```

Stop 
```
kill $(ps aux | awk '/elasticsearch/ {print $2}') 
```

## Logstash
Install
```
tar -xvzf logstash.tar.gz
cd /logstash
```

Start
```shell script
/bin/logstash
```

Stop 
```
kill $(ps aux | awk '/logstash/ {print $2}') 
```

## Kibana
Install
```
tar -xvzf kibana.tar.gz
cd /kibana
```

Start
```shell script
/bin/kibana
```

Stop 
```
kill $(ps aux | awk '/kibana/ {print $2}') 
```

## ElasticAPM
Install
```
tar -xvzf elastic-apm.tar.gz
cd /elastic-apm
```

Start
```shell script
/bin/elastic-apm
```

Stop 
```
kill $(ps aux | awk '/elastic-apm/ {print $2}') 
```

Configuration
edit `apm-server` host and `output.elasticsearch` host
참고 : [ElasticAPM](https://www.elastic.co/guide/en/apm/server/current/getting-started-apm-server.html) 
```shell script
vi /apm-server.yml
```

If you want to deploy using Kubernetes, you can refer to 3 yaml files: apm-ingress, apm-service, and apm-deployment.

You need to modify `<your elastic apm host>` in the apm-ingress.yaml file.

You need to modify the `apm-server`,` output.elasticsearch` host in the apm-deployment.yaml file.

Docker image is [ElasticAPM official image](https://www.elastic.co/guide/en/apm/server/current/running-on-docker.html).
