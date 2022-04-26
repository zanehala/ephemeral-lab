terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "~> 2.9.9"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.0.1.50:8006/api2/json"
  pm_api_token_id = "root@pam!tf-token"
  pm_api_token_secret = var.api_token
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "tf-test-vm" {
  name = "tf-test-vm-1"
  target_node = "pve"
  clone = "rocky-cloud-init"

  os_type = "cloud-init"
  cores = 1
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=10.0.1.52/24,gw=10.0.1.1"

}