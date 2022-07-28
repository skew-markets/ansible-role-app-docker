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
| name | type | purpose | default |
| ---- | ---- | ------- | ------- |
| docker_logrotation | list(dict) | sets up files in /etc/logrotate.d | [] or your list of dict(filename, count, path, size) | |
| docker_pkg_dependencies | list(string) | list of packages Docker depends on | varies |
| docker_pkg_names | list(string) | list of Docker packages to install | ['docker-ce'] |
| docker_pkg_state | oneOf(absent,present) | whether to install `docker_pkg_names` | present |
| docker_svc_enabled| Boolean | whether to start on reboot | true |
| docker_svc_state | SystemdState | put the Docker service in this state | started |
| docker_users | list of users to add to the docker group | TBC |

## Supported Distros
Ubuntu 16+

****
