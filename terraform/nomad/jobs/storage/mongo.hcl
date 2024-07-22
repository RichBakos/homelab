job "mongo" {
  type      = "service"
  namespace = "storage"

  group "mongo" {

    network {
      port "mongo" { static = "27017" }
    }

    volume "mongo" {
      type   = "host"
      source = "mongo"
    }

    service {
      name = "mongo"        
      port = "mongo"    
    }		

    task "mongo" {
      driver = "docker"

      config {
        image = "docker.io/mongo:6.0.14"
        network_mode = "host"        
	      ports = ["mongo"]	
	      volumes = [
          "/mnt/volumes/mongo/init-mongo.js:/docker-entrypoint-initdb.d/init-mongo.js:ro",
        ]
      }

      volume_mount {
        volume = "mongo"
        destination = "/data/db"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }

    }
  }
}
