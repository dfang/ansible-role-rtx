# mapping

| os                       | ansible_distribution | ansible_os_family | ansible_pkg_mgr |
| ------------------------ | -------------------- | ----------------- | --------------- |
| debian 10                | Debian               | Debian            | apt             |
| debian 11                | Debian               | Debian            | apt             |
| debian 12                | Debian               | Debian            | apt             |
| ubuntu 18.04             | Ubuntu               | Debian            | apt             |
| ubuntu 20.04             | Ubuntu               | Debian            | apt             |
| ubuntu 22.04             | Ubuntu               | Debian            | apt             |
| rockylinux 8             | Rocky                | RedHat            | dnf             |
| rockylinux 9             | Rocky                | RedHat            | dnf             |
| fedora34                 | Fedora               | RedHat            | dnf             |
| fedora35                 | Fedora               | RedHat            | dnf             |
| fedora36                 | Fedora               | RedHat            | dnf             |
| fedora37                 | Fedora               | RedHat            | dnf             |
| fedora38                 | Fedora               | RedHat            | dnf             |
| centos8                  | CentOS               | RedHat            | dnf             |
| amazonlinux2             | Amazon               | RedHat            | yum             |


NOTES:

for debian-based os, just use apt

for readhat-based os, prefer dnf over yum (dnf/yum available on all redhat-based os above **EXCEPT** amazonlinux2)


- https://linux.how2shout.com/what-is-the-difference-between-yum-and-dnf/

- http://www.differencebetween.net/technology/difference-between-yum-and-dnf/