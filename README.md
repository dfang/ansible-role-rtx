ansible-role-rtx
=========

A role for install [rtx](https://github.com/jdxcode/rtx) on Linux servers.  [中文说明](https://github.com/dfang/ansible-role-rtx/blob/main/README-zh_CN.md)

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

Role Variables
--------------

```
system_wide: true
rtx_user: ubuntu
rtx_plugins:  see example playbook
```

1. only support bash shell  

2. the rtx binary will always install to `/usr/local/bin/rtx`  

3. if `system_wide: true`, `RTX_DATA_DIR` will be set to `/opt/rtx/`  
   if `system_wide: false`, `RTX_DATA_DIR` will be set to  `~/.local/share/rtx`  
   the default is `true`. 

4. if `system_wide: true`, `/etc/profile.d/rtx.sh` with below content will be created
    ```
    # {{ ansible_managed }}

    if [ -f "/usr/local/bin/rtx" ]; then
      export RTX_DATA_DIR=/opt/rtx
      eval "$(rtx activate bash)"
    fi
    ```

    if `system_wide: false`, the content below will be appended to `~/.bashrc`
    
    ```
    export RTX_DATA_DIR=$HOME/.local/share/rtx
    eval "$(rtx activate bash)"
    ```

Dependencies
------------

None


Example Playbook
----------------

for example: 

for erlang this will install 26.0.2 and set it to global version. for nodejs, this will install versions `6.14.0`, `20.0.0` and set `20.0.0` to global version  

```
    - hosts: servers
      become: yes
      gather_facts: yes
      roles:
        - role: "ansible-role-rtx" # or dfang.rtx
      vars:
        system_wide: false
        rtx_user: ubuntu
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
          # - name: "zoxide"
          #   repository: "https://ghproxy.com/https://github.com/nyrst/asdf-zoxide"           # a plugin repository, optional
          #   versions: ["0.9.1"]
          #   global: "0.9.1"
          # - name: "fzf"
          #   repository: "https://ghproxy.com/https://github.com/kompiro/asdf-fzf.git"        # a plugin repository, optional
          #   versions: ["0.41.1"]
          #   global: "0.41.1"
          # - name: "fd"
          #   repository: "https://gitlab.com/wt0f/asdf-fd.git"                                # a plugin repository, optional
          #   versions: ["8.7.0"]
          #   global: "8.7.0"
          # - name: "ag"
          #   repository: "https://ghproxy.com/https://github.com/koketani/asdf-ag.git"        # a plugin repository, optional
          #   versions: ["2.2.0"]
          #   global: "2.2.0"
          # - name: "tmux"
          #   repository: "https://ghproxy.com/https://github.com/aphecetche/asdf-tmux.git"    # a plugin repository, optional
          #   versions: ["latest"]
          #   global: "latest"
          # - name: "java"
          #   repository: "https://ghproxy.com/https://github.com/halcyon/asdf-java.git"
          #   versions: ["openjdk-11"]
          #   global: "openjdk-11"
          # - name: "maven"
          #   repository: "https://ghproxy.com/https://github.com/halcyon/asdf-maven.git"
          #   versions: ["3.8.6"]
          #   global: "3.8.6"

```

Check compatibility between elixir and erlang:  

https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp


TODO
-------

more test with molecule and update meta/main.yml

License
-------

MIT


