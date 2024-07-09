# Homelab

This repository contains the configuration of my homelab. It leverages [Nomad](https://nomadproject.io), [Consul](https://www.consul.io/), and [Packer](https://packer.io). Over time I've evolved my lab from FreeBSD jails -> LXC -> Docker -> and finally (IaC). I'm using [Terraform](https://www.terraform.io) to manage the state of my homelab.

I'm running a 3 node [ProxMox](https://www.proxmox.com/en/) cluster across these low power (Xeon-D ) [SuperMicro SuperServers](https://supermicro.com/en/products/system/midtower/5028/sys-5028d-tn4t.cfm). 

## Workloads

Here are the workloads I run:

* [forwardAuth](https://github.com/thomseddon/traefik-forward-auth) - OAuth/SSO login and authentication for the traefik reverse proxy/load balancer.
* [Traefik](https://traefik.io) - I have HaProxy (via [pfSense](https://www.pfsense.org)) balancing requests to Traefik running as a system job.
* [VaultWarden](https://github.com/dani-garcia/vaultwarden) - Password manager.
* [CoreDNS](https://coredns.io/) - DNS services for the cluster.
* [Keepalived](https://www.keepalived.org/) - So I don't lose track of CoreDNS.
* [InfluxDB](https://www.influxdata.com/) - Metrics for Proxmox and pfSense.
* [Prometheus](https://prometheus.io/) - Metrics for nomad and it's jobs.
* [Loki](https://grafana.com/oss/loki/) - Logs (because metrics aren't useful, not for me anyway).
* [Grafana](https://grafana.com) - Because we must have pretty dashboards.
* [Postgres](https://postgresql.org/) - I have years of data stored here from a variety of sources .
* [MongoDB](https://mongodb.com/) - This is the backend for my [unifi](https://www.ui.com) deployment.
* ...
* ...
* You can see the full list [here](terraform/nomad/jobs)

## Storage

I'm currently using host volumes. I don't see the benefit of CSI for me this time. I have [Gluster](https://www.gluster.org) backed by ZFS on my ProxMox cluster, so host volumes make sense. It's fast, it's easy, it's error free.