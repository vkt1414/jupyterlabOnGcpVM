provider "google" {
  project = var.project
}

resource "google_compute_firewall" "jupyter_and_http" {
  name    = "jupyter-and-http-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8888"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

}


resource "google_compute_instance" "jupyter" {
  name                      = var.instance_name
  machine_type              = var.machinetype
  zone                      = var.zone
  allow_stopping_for_update = true
  #min_cpu_platform          = "Intel Ice Lake"

  shielded_instance_config {
    enable_secure_boot = true
  }

  guest_accelerator {
   type = var.gpu_type
   count = 1
  }


  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      type  = "pd-balanced"
      size  = var.boot_disk_size
    }

  }

  network_interface {
    network    = "default"
    subnetwork = "default"
    access_config {
      // Ephemeral IP address
    }
  }

  metadata = {
    "startup-script" = "${file("start-up-script.sh")}"
  }
}
