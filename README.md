# Ansible skeleton

All roles and playbooks required to fully deploy our system components

## clone and update

clone: `git clone --recurese-submodules <url>`
update: `git pull --recurse-submodules`

## Usage prerequisites

- ensure Ansible is present on management host:
```bash
pip3 install ansible
```
- target host(s) accessible over SSH (or other possible [connection protocol](https://docs.ansible.com/ansible/latest/plugins/connection.html))
- all hosts are [configured](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) in the inventory file [hosts](./inventory/hosts)

## Example usage

```bash
cd ansible-skeleton/
ansible-playbook playbooks/dev/brewmasters_backend.yml
```

### usefull options
`'-i <path_to_inventory>' option`
- specifies the path to an inventory file
- contains all target hostnames ([example inventory](inventory/prod/hosts))

`'-K' option`
- `ask_for_pass` option which is often requirement in case of privilege escalation

`'-C' option`
- runs a playbook in a check mode. Meaning no action is really done on the target system

`'-D' option`
- runs a playbook in 'diff' mode. Shows differences in configuration files and other

refer to other options in the official [ansible-playbook docs](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html)
