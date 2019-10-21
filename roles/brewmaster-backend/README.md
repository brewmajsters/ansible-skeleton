brewmaster-backend
=========

Download and install brewmajsters/brewmaster-backend with setup systemd service for flask server.

Requirements
------------

None

Role Variables
--------------

    repo:
      dest: <str, absolute or relative path of github repo destination directory>
      version: <str, branch name or commit to clone>
    develop: <bool, if false (default) the application is install with '--deploy --system' flags>

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles: brewmaster-backend
        vars:
          repo:
            dest: realtive/path/to/dest
          develop: true

License
-------

None

Author Information
------------------

Tomas Bellus
