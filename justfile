default:
    just --choose

lint:
    ansible-lint .

prepare:
    pip3 install ansible-lint

upload:
    tmp/upload.sh