ansible-role-rtx
=========

A role for install [rtx](https://github.com/jdxcode/rtx) on Linux servers.  [英文说明](https://github.com/dfang/ansible-role-rtx/blob/main/README.md)

How to Install
------------

Install from ansible galaxy

```
ansible-galaxy role install dfang.rtx
```

Install from github

```
ansible-galaxy role install git+https://github.com/dfang/ansible-role-rtx
```

the **RECOMMEND** way is to lock dependency version in your [requirements.yml](https://docs.ansible.com/ansible/latest/galaxy/user_guide.html#installing-roles-and-collections-from-the-same-requirements-yml-file):

```
---
collections:
roles:
  #   - name: dfang.rtx
  #     version: v0.2

  #   - src: https://github.com/dfang/ansible-role-rtx
  #     type: git
  #     version: main
```


Compatibilities
--------------

support these linux operating systems except centos7(because of GLIBC_2.18 required by rtx):

- centos7 (**not supported**)
- centos8
- amazonlinux2
- debian10
- debian11
- debian12
- fedora34
- fedora35
- fedora36
- fedora37
- fedora38
- rockylinux8
- rockylinux9
- ubuntu1804
- ubuntu2004
- ubuntu2204
- opensuse (TODO)
- OracleLinux (TODO)

Role Variables
--------------

```
system_wide: false
rtx_plugins: see example playbook
```

1. only support bash shell

2. if `system_wide: true`, `RTX_DATA_DIR` will be set to `/opt/rtx/`, rtx binary will install to `/usr/local/bin/rtx`

   if `system_wide: false`, `RTX_DATA_DIR` will be set to  `~/.local/share/rtx`, rtx binary will install to `~/bin/rtx`

   the default is `false`.

3. if `system_wide: true`, `/etc/profile.d/rtx.sh` with below content will be created
    ```
    # {{ ansible_managed }}

    if [ -f "/usr/local/bin/rtx" ]; then
      export RTX_DATA_DIR=/opt/rtx
      eval "$(/usr/local/bin/rtx activate bash)"
    fi
    ```

    if `system_wide: false`, these content below will be appended to `~/.bashrc`

    ```
    export RTX_DATA_DIR=$HOME/.local/share/rtx
    eval "$(~/bin/rtx activate bash)"
    ```

Dependencies
------------

None


Example Playbook
----------------

for example:

for erlang this will install 26.0.2 and set it to global version.
for nodejs, this will install versions `6.14.0`, `20.0.0` and set `20.0.0` to global version

```
    - hosts: servers
      become: yes
      gather_facts: yes
      roles:
        - role: "ansible-role-rtx" # or dfang.rtx
      vars:
        system_wide: false
        rtx_plugins:
          - name: "erlang"
            versions: ["26.0.2"]
            global: "26.0.2"
          - name: "elixir"
            versions: ["1.15.2-otp-26"]
            global: "1.15.2-otp-26"
          - name: "nodejs"
            versions: ["16.14.0", "20.0.0"]
            global: "20.0.0"
          - name: "golang"
            versions: ["1.20"]
            global: "1.20"
          - name: "python"
            versions: ["3.10"]
            global: "3.10"
          - name: "ruby"
            versions: ["3.1.4"]
            global: "3.1.4"
          - name: "java"
            versions: ["openjdk-11"]
            global: "openjdk-11"
          - name: "maven"
            versions: ["3.8.6"]
            global: "3.8.6"
```

Check compatibility between elixir and erlang:

https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp


TODO
-------

- add oracle linux and opensuse support
- more test with molecule and update meta/main.yml

License
-------

MIT
