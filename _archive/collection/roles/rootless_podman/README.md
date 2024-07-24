Role Name
=========

An Ansible role to enable a user to run Podman rootless containers.

Requirements
------------

None.

Role Variables
--------------

```yaml
podman_user_name: ansible
podman_user_group: "{{ podman_user_name }}"
```

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: rootless-podman
      podman_user_name: runner
      become: yes
```

License
-------

None

Author Information
------------------

This role was created by [Ryan Etten](https://github.com/redhatryan)
