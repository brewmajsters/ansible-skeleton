postgresql
=========

Download and install postgresql database.

Requirements
------------

None

Role Variables
--------------

    postgresql_database_user: <str, postgresql username>
    postgresql_database_password: <str, postgresql user password>
    postgresql_database_name: <str, postgresql database to be created>

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles:
         - role: postgresql

License
-------

None

Author Information
------------------

Tomas Bellus
