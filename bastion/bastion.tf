resource "google_compute_instance" "bastion" {
  name         = var.bastion_name
  machine_type = "f1-micro"
  tags = ["bastion"]

  scheduling {
    preemptible = true
    automatic_restart = false
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = var.provider_subnetwork_name
    access_config {
      nat_ip = var.nat_ip
    }
  }
  metadata = {
    ssh-keys = "terraform:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtDMGjq/AeiI8aPb8Opsvv14YUeZjj4tn8hvmnHAIiQgaczrPJ3U1YEnjuIO9MbGYP2KzawAbp/nEtBWUm4WWVB4jk1hq415rTpYsnRso9VMq1Pf3BBAKB1nE/ppQpi9XXyUbPZwz5RVFhm8XnYDweBylQW1YkYs9ITkFI0lmL4doOLIZWSnE4RfFMg1jO7gcoC5UTJpf1vw06F/aGc/rcBdItD5H/l7aR4dRxHydm912CQZHU7DzdArj/O7TLmDr/n6FanUJMpy2dEY3BDoFYoRd35F4MThVYIbGrXzb4qDumA2h26YN+rMt3ma4PaW6MwrePfJ0xCn+WDn+URouN1Ira3C0lUY7csC154eciS+O3SeDiu1HBCCku4bYW96skq8P3JmZ+fVcfBQ1W1ToXGMYHmi5FFRB2nhXgoT6xEqPjCQdNMsoEt/noeojqu4t4oXU6zGMyYLmlQH5ozchH4wM4LNCFH+q9qsPcqsGPamNA4r5dSr5eljqn3QC0fDmuNl+hVGYK5sOea8E/dO5SuuTWOBwpLFuz8SglMBlBs2xY1ejyrxi3sMYW3JIMHO8Fo9+aWs72OQWj6i/JkAk+AvNg5gSfuNuqmTK9Ue0A8SAZ0XnVxpDCyEPpBGe7/6aUghvEQiGzVurvGcm4fxG5EhhxT/fWajOu5/7OQTBsVw=="
  }
}