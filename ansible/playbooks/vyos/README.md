### Playbook prerequisites

### Dependencies

#### Python requirements

These can be installed as follows:

```shell
cd <repo_root>/ansible/playbooks/vyos
pip install -r requirements.txt
```

### VyOS settings

#### Static IP address

The VyOS device needs a static IP address where Ansible can reach it.

```console
configure
delete interfaces ethernet <interface> address dhcp
set interfaces ethernet <interface> address <address>/24
commit
```

#### SSH enabled

The VyOS device needs SSH enabled so that Ansible can reach it.

```console
configure
set services ssh
commit
```
