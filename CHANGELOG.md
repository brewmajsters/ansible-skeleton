# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- redesign the inventory groups and hosts
    - move old inventory to sub-inventory brewmaster

- both backend and frontend listen address in pillcrusher inventory

### Added
- pillcrusher dedicated inventory
- timescaledb docker container
    - timezone and local time volumes - `/etc/timezone` and `/etc/localtime`
    - always build image with 'latest' tag and pull latest base timescale image
    - always create container from 'latest' tag

- systemd unit file options to backend and frontend
    - restart policy
    - install section for enabling the service on startup
    - setup presedence in service activation ('After' keyword)

### Fixed
- ansible-role-brewmaster-frontend and ansible-role-brewmaster-backend
    - new variable structure and add parametrize frontend listen address

## [1.2.0] - 2020-11-20
### Added
- ansible-role-hotspot
- development playbook for hotspot + dhcp server
- ansible-role-brewmaster-frontend:
    - API update - incorporate brewmaster-frontend new environment variables

- timescaledb seeding
    - playbook
    - seed sql files

- more required frontend environment variables

### Changed
- timescaledb docker tasks:
    - build docker image with tag of latest git repo tag

## [1.1.0] - 2020-04-28
### Added
- production master playbook for raspberry pi deployment
    - brewmaster-pi (raspberry pi host) host vars

- ansible-role-brewmaster-frontend:
    - install nodejs from binary archive url (provides custom version and architecture specific binaries)

### Changed
- ansible-role-brewmaster-backend:
    - role variables API
    - backend installation via pipenv to pip (generate requirements.txt file from Pipfile.lock)

- ansible-role-brewmaster-frontend:
    - role variables API
    - listen on the 0.0.0.0 address by default

- ansible-role-docker:
    - architecture specific apt repo for docker related packages

- ansible-role-timescaledb:
    - role variables API

### Removed
- ansible-role-timescaledb:
    - OS family specific deployment

### Fixed
- ansible-role-brewmaster-backend:
    - starting of systemd service

- ansible-role-brewmaster-frontend:
    - starting of systemd service

## [1.0.0] - 2020-04-01
### Added
- All project related ansible roles in the github organization [brewmajsters](https://github.com/brewmajsters)
- Dev playbooks for backend, frontend, timescaledb, docker, mqtt, development LXC container
- Inventory file


[Unreleased]: https://github.com/brewmajsters/ansible-skeleton/compare/1.2.0...develop
[1.2.0]: https://github.com/brewmajsters/ansible-skeleton/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/brewmajsters/ansible-skeleton/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/brewmajsters/ansible-skeleton/compare/0.0.1...1.0.0
