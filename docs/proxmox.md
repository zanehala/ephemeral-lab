# Creating a cloud-init template VM

* Get a qcow image of a cloud-init capable distro.
* SCP it into the proxmox host somewhere.
* Create a VM and give it a cloud-init drive.
```
qm set <vmid> --ide2 <storage>:cloudinit
```
* Import the image using 
```
qm importdisk <vmid> <yourimage.qcow2> <namestoragepool>
```
then 
```
qm rescan
```
In the hardware section of the VM it'll probably show the drive as unused, 
just edit and immediately save it and it should add it.

* Add an SSH key and set the IP configs.
* Boot the machine and do `yum update` and `yum install qemu-guest-agent` if the image doesn't have it already.
* Make it a template.


# Creating an API key for Terraform

* Datacenter > Permissions > API Tokens
* Add to a user, privilege separation off (Set relevant permissions on user)