job "keepalived" {
  type      = "system"
  namespace = "networking"  
  
  group "keepalived" {
    
    task "keepalived" {
      driver = "docker"

			config {
        image = "osixia/keepalived:2.0.20"
        network_mode = "host"
        cap_add = ["NET_ADMIN", "NET_BROADCAST", "NET_RAW"]  
        args = [ "--copy-service" ]
        volumes = [
          "local/keepalived.conf:/user/local/etc/keepalived/keepalived.conf",
          "local/keepalived.conf:/container/service/keepalived/assets/keepalived.conf"          
        ]           
      }

      template {    
        destination = "local/keepalived.conf"
        change_mode = "restart"
        data = <<EOF
global_defs {
  default_interface {{ sockaddr "GetPrivateInterfaces | include \"network\" \"172.16.30.0/24\" | attr \"name\"" }}
}

vrrp_instance VI_1 {
  interface {{ sockaddr "GetPrivateInterfaces | include \"network\" \"172.16.30.0/24\" | attr \"name\"" }}

  virtual_router_id 51
  priority {{ env "meta.keepalived_priority" }}
  nopreempt

  unicast_peer {
    {{- with $node := node -}}
    {{ range nodes }}
    {{- if ne .Address $node.Node.Address }}
    - {{ .Address }}
    {{- end -}}
    {{- end -}}
    {{- end }}
  }

  virtual_ipaddress {
    172.16.30.2/24
  }

  authentication {
    auth_type PASS
    auth_pass d0cker
  }

  /container/service/keepalived/assets/notify.sh
}    
EOF
      }

      resources {
        cpu    = 10
        memory = 12
      }
    }      
  }
}