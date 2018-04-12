# Instructions

Install *terraform* and *terragrunt*.

`brew install terraform terragrunt`

Create the file and add your credentials to: `~/.aws/credentials`

```
[default]
aws_access_key_id = <access id>
aws_secret_access_key = <access key>
```

`cd learnxp-infrastructure`

__Enter `yes` at all prompts when running the following commands.__

## Buckets

`cd buckets`

`terragrunt apply`

`cd ..`

## Network

`cd network`

`terragrunt apply`

`cd ..`

## Nodes

`cd nodes/<group>`

`terragrunt apply-all`

### First group

- proxy
- admin
- control

#### Bootstrap Procedure

`ssh -A -l root proxy-alpha-1.lrnxp.com -L 8500:consul.service.consul:8500 -L 8888:influxdb-chronograf.service.consul:8888`

`ssh -A admin-1`

`cd ansible`

`ansible-playbook -i inventory.py archlinux/playbooks/control/bootstrap/consul.yml`

`ash admin systemctl restart consul@client`

`ash proxy systemctl restart consul@client`

`ash control systemctl restart systemd-resolved`

`ash admin systemctl restart systemd-resolved`

`ash proxy systemctl restart systemd-resolved`

### Second Group

- mysql
- web
- nginx
