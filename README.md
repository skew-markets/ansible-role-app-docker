----
# ansible-role-app-docker

## Purpose
* Installs docker CE
* Adds some convenience scripts in /usr/local/bin
* Adds a Bash aliases files to /usr/local/etc/bash.d

## Required variables
| name | purpose |
| ---- | ------- |

## Optional variables
| name | purpose |
| ---- | ------- |

## Defaulted variables
| name | purpose | default |
| ---- | ------- | ------- |
| docker_dependencies | list of packages needed to add the docker repo to APT | varies |
| docker_logrotation | sets up files in /etc/logrotate.d | [] or your list of dict(filename, count, path, size) | |
| docker_packages | list of docker packages to install | TBC |
| docker_users | list of users to add to the docker group | TBC |

## Supported Distros
Ubuntu 16+
****
