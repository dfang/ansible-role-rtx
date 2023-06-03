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
