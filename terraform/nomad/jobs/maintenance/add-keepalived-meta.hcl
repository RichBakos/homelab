job "add-keepalived-meta" {
  type      = "sysbatch"
  namespace = "maintenance"

  group "maintenance" {
    task "maintenance" {
      driver = "raw_exec"

      config {
        command = "/bin/bash"
        args    = ["-c", "R=$(shuf -i 155-190 -n 1); nomad node meta apply keepalived.priority=$R;"]
      }
    }
  }
}