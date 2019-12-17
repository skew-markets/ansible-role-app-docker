# MANAGED_BY_ANSIBLE
# --------------------------------

alias   dock='sudo docker'
alias  dimgs='dock images'
alias  dlogs='dock logs'
alias    dps='dock ps'
alias   dpsa='dock ps -a'
alias   dpsx='dock ps --filter status=exited'
alias  dpsai='dock ps -aq | tr "\n" " " '

alias dshell='dock run -i -t --rm'
alias   dvol='dock volume ls'

alias vid='vi Dockerfile'

# --------------------------------
