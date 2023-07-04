# README

## install python

rtx install python 3.10.11
rtx global python 3.10.11

## install poetry

curl -sSL https://install.python-poetry.org | python3 -
poetry install # install dependency
poetry shell # activate venv



## Molecule


```
# given phase
$ molecule create

# when phase
$ molecule converge

# then phase
$ molecule verify
```

0. SHELL 只支持bash

1. rtx binary始终安装到 /usr/local/bin/

2. 如果system_wide: true, RTX_DATA_DIR 设置为 /opt/rtx/
   如果system_wide: false, RTX_DATA_DIR 设置为 ~/.local/share/rtx
   默认为true

3. 如果system_wide: true, /etc/profile.d/rtx.sh 

```
# Ansible managed

if [ -f "/usr/local/bin/rtx" ]; then
  eval "$(rtx activate bash)"
fi
```
如果system_wide: false, 则将rtx activate bash加到~/.bashrc



- https://github.com/jdxcode/rtx#rtx_data_dir
- https://github.com/jdxcode/rtx#register-shell-hook
