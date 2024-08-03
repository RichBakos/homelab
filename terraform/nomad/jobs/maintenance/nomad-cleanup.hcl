job "nomad-cleanup" {
  type      = "batch"
  namespace = "maintenance"

  periodic {
    crons            = ["@daily"]
    prohibit_overlap = true
  }

  group "garbage_collection" {
    task "garbage_collection" {
      driver = "raw_exec"

      config {
        command = "nomad"
        args    = ["system", "gc", "--address", "http://clarkson.bakos.lan:4646"]
      }
    }
  }
}