timescaledb
=========

Download and install postgresql database and add the TimeScaleDB extension.

Requirements
------------

None

Role Variables
--------------

    debian_postgresql_database_user: <str, postgresql username>
    debian_postgresql_database_password: <str, postgresql user password>
    debian_postgresql_database_name: <str, postgresql database to be created>

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles:
         - role: timescaledb

License
-------

None

Author Information
------------------

Tomas Bellus