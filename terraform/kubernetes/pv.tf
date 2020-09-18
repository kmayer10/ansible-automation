resource "kubernetes_persistent_volume" "pv" {
	metadata {
		name = "kul-pv"
	}

	spec {
		capacity = {
			storage = "1Gi"
		}
 		
		access_modes = ["ReadWriteMany"]
  		persistent_volume_source {
			host_path {
				path = "/tmp/pv-demo"
				type = "DirectoryOrCreate"
			}
		}
	}
}
