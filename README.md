# Ansible skeleton

All roles and playbooks required to fully deploy our system components

## Usage prerequisites

- ensure Ansible is present on management host
    ```bash
    pip3 install ansible
    ```
- target host accessible over SSH

## Usage

```bash
cd ansible-skeleton/
ansible-playbook [-i <path_to_inventory_file>] playbooks/<path_to_playbook> [-KCD]
```

`'-i' option`
- specifies the path to a [inventory file](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)
- contains all target hostnames ([example inventory](inventory/prod/hosts))

`'-K' option`
- `ask_for_pass` option which is often requirement in case of privilege escalation

`'-C' option`
- runs a playbook in a check mode. Meaning no action is really done on the target system

`'-D' option`
- runs a playbook in 'diff' mode. Shows differences in configuration files and other

## Update

```bash
git pull --recurse-submodules
```
