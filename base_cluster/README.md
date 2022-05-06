Deploy a basic k3s cluster, with a virtual IP for a HA control plane using [kube-virt.](https://github.com/kube-vip/kube-vip)

This should
* Deploy 3 VM's based off a previously created Rocky linux template.
* Connect with Ansible and deploy/configure a basic k3s cluster test bed.
* Return a `kubeconfig.yaml`

To run:

```console
$ terraform init
```

```console
$ terraform apply
```

Wait 30s to a minute for the VM's to start up

```console
$ ansible-playbook --inventory inventories/lab.yaml test-ansible.yaml
```