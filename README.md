# Prometheus #

This services is based on the DC/OS SDK.  Documentation for the development and operation of services built using this approach is availble [here](https://mesosphere.github.io/dcos-commons/).

## Build ##
The following envirornment variables are required for building this project.

```
AWS_SECRET_ACCESS_KEY
AWS_ACCESS_KEY_ID
```

```bash
$ ./build.sh aws
...
---
(Re)install your package using the following commands:
dcos package uninstall prometheus

- - - -
For 1.9 or older clusters only
dcos node ssh --master-proxy --leader "docker run mesosphere/janitor /janitor.py -r prometheus-role -p prometheus-principal -z dcos-service-prometheus"
- - - -

dcos package repo remove prometheus-aws
dcos package repo add --index=0 prometheus-aws https://universe-converter.mesosphere.com/transform?url=https://infinity-artifacts.s3.amazonaws.com/autodelete7d/prometheus/20171025-152355-V5PMXIcE5jSlRSM7/stub-universe-prometheus.json
dcos package install --yes prometheus
```

### Add the repo ###
```
$ dcos package repo remove prometheus-aws
$ dcos package repo add --index=0 prometheus-aws https://universe-converter.mesosphere.com/transform?url=https://infinity-artifacts.s3.amazonaws.com/autodelete7d/prometheus/20171025-152355-V5PMXIcE5jSlRSM7/stub-universe-prometheus.json
```
In order to enable collection of metrics from the `dcos-metrics` service an ACS token must be provided.
```bash
$ dcos config show core.dcos_acs_token
abc1234...
```

### Install ###
Create an `options.json` file.
```bash
$ cat options.json
{
  "service": {
    "auth-token": "abc123..."
  }
}
```
Install with the `options.json` file.
```bash
$ dcos package install --yes prometheus --options=options.json
...
```
