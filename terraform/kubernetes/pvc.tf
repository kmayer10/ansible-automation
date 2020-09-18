resource "kubernetes_persistent_volume_claim" "pvc"{
	metadata {
		name = "pvc"
	}

	spec {
		volume_name = kubernetes_persistent_volume.pv.metadata.0.name
		access_modes = ["ReadWriteMany"]
		resources{
			requests = {
				storage = ".5Gi"
			}
		}
	}
}
