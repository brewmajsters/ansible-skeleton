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
- all hosts are [configured](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) in the inventory file [hosts](./inventory/brewmaster/hosts)

## Development setup (Linux only)

Development playbooks are in the [dev](./playbooks/dev) directory. These playbooks are dependent on an existing LXC container defined in the [hosts file](./inventory/brewmaster/hosts).

**REQUIREMENTS**:
- setup `lxd` (e.g. [ansible-role-lxd](https://github.com/Provizanta/ansible-role-lxd))
- run the [dev_container.yml](./playbooks/dev/dev_container.yml) playbook
    - it creates and starts the dev container 'pseudo-raspbian'

Now you have a running instance of a Debian buster LXC container, which will host all applications.

**DEPLOYMENT**
- run any of the dev playbooks as specified in the Exmaple on the bottom of this README.

### Alternative development setup

If you're not on Linux or you don't want to use LXC containers.

- modify the [hosts file](./inventory/brewmaster/hosts) to your need
- change the target host in each playbook you use

## Production setup (meant for Raspberry pi only)

Production playbooks are in the [prod](./playbooks/prod) directory. These playbooks are dependent on a accessible Raspberry pi.

**REQUIREMENTS**:
- Raspberry pi accessible over SSH host `brewmaster-pi` as specified in the [hosts file](./inventory/brewmaster/hosts). (configured in `~/.ssh/config` on the ansible host)
    - NOTE: this requirement is more specific to eliminate any skeleton modifications
```bash
Host brewmaster-pi
  Hostname 192.168.0.22
  Port 22
  User pi
```


**DEPLOYMENT**
- use the [master playbook](./playbooks/prod/master.yml) to deploy the whole brewmaster system
- possible role variables can be configured in the [host variables](./inventory/brewmaster/host_vars/brewmaster-pi/vars.yml)

## Inventories

Although all _hosts_ file references in this README are to the same inventiry file, there is another hosts file for the side project **pillcrusher** ([hosts](./inventory/pillcrusher/hosts)).

- the pillcrusher inventory for separating the variables from the main brewmaster ptoject
- use the inventory of the current project by directly passing the `-i` option to *ansible_playbook*
- current inventories:
    - [pillcrusher inventory](./inventory/pillcrusher)
    - [brewmaster inventory](./inventory/brewmaster)

## Example usage

```bash
cd ansible-skeleton/
ansible-playbook -i inventory/brewmaster/hosts playbooks/dev/brewmasters_backend.yml
# or
ansible-playbook -i inventory/brewmaster/hosts playbooks/prod/master.yml
```

### usefull options
**`-i <PATH_TO_INVENTORY>`** option
- specifies the path to an inventory hosts file e.g. _inventory/brewmaster/hosts_
- contains all target hostnames

**`-K`** option
- *ask_for_pass* option which is often requirement in case of privilege escalation

**`-C`** option
- runs a playbook in a check mode. Meaning no action is really done on the target system

**`-D`** option
- runs a playbook in 'diff' mode. Shows differences in configuration files and other

refer to other options in the official [ansible-playbook docs](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html)

## Available playbooks

- [seed_timescaledb_pillcrusher.yml](./playbooks/prod/seed_timescaledb_pillcrusher.yml) and [seed_timescaledb.yml](./playbooks/prod/seed_timescaledb.yml)
    - simple DB seeding procedure with specified SQL scripts

- [master.yml](./playbooks/prod/master.yml)
    - deploys the whole system that of which whould reside on the Rasberry Pi i.e. backend, frontend, mqtt broker, docker, timescaldb docker container
