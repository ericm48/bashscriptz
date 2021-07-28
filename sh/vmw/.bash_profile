#!/bin/bash
#
#

#export HISTFILESIZE=0

export HOSTNAME=$(uname -n)

#export LS_COLORS=$(echo $LS_COLORS | sed "s/di=\(..\);../di=\1;93/")

export M2_HOME=
export M2_HOME='/opt/java/apache-maven-3.3.9'

export ANT_HOME=
export ANT_HOME='/opt/java/apache-ant-1.8.4'

export JAVA_HOME=
#export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-11.0.11.jdk/Contents/Home'

export GRAAL_VM_HOME=
export GRAAL_VM_HOME='/Library/Java/JavaVirtualMachines/graalvm-ce-lts-java11-20.3.1/Contents/Home'

#export JAVA_HOME=$GRAAL_VM_HOME

export M2_DATA=
export M2_DATA='/Users/emanley/data/maven-3.x'

#export TERRA_HOME=
#export TERRA_HOME='/opt/terraform-0.8.4'

export K8_CUSTOM=
export K8_CUSTOM='/Users/emanley/dev2/k8/3rdParty/master/kubectx'

export K8_VSPHERE=
export K8_VSPHERE='/opt/kubectl-vsphere/pez-test-tmc/bin'

export BASH_SILENCE_DEPRECATION_WARNING=1

export PYENV_ROOT=
export PYENV_ROOT="$HOME/.pyenv"

export SDKMAN_DIR=
export SDKMAN_DIR='/opt/sdkman-5.11.5'
#export SDKMAN_DIR='/Users/emanley/.sdkman'

export TKGI_DIR=
export TKGI_DIR='/opt/vmware/tkg-i-1.11.0'

export TANZU_CLI_DIR=
export TANZU_CLI_DIR='/opt/vmware/tanzu-cli-1.3.1/bin'

export CARVEL_TOOLS_DIR=
export CARVEL_TOOLS_DIR='/opt/vmware/carvel-tools/bin'

export KPACK_DIR=
export KPACK_DIR='/opt/vmware/kpack-0.3.1'

export OCTANT_DIR=
export OCTANT_DIR='/opt/octant-0.21.0'

export PATH=".:/Users/emanley/dev2/sh:/opt/jq-1.6:/opt/yq-3.4.1:/opt/kind-0.10.0:$K8_CUSTOM:$K8_VSPHERE:/opt/cfssl:$PYENV_ROOT/bin:/opt/ruby/portable-ruby-2.3.7/bin:$JAVA_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$TKGI_DIR:$TANZU_CLI_DIR:$CARVEL_TOOLS_DIR:$OCTANT_DIR:$KPACK_DIR:/usr/local/bin:$PATH"

export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6) # blue text
export KUBECTX_CURRENT_BGCOLOR=$(tput setaf 7) # white background
export KUBE_PS1_SYMBOL_USE_IMG='false'
export KUBE_PS1_NS_COLOR='yellow'
export KUBE_PS1_SYMBOL_COLOR='cyan'

source /Users/emanley/dev2/sh/kube-ps1.sh

#export PS1="${LOGNAME}@${HOSTNAME}:\$PWD>"

# Regular New & Improved
#export PS1="\u@\h:\$PWD>"

# K8 previous
PS1='\u@\h:$(kube_ps1)\>'

# K8 New
#PS1='[\u@\h \W $(kube_ps1)]\$ '

#PS1='$(kube_ps1)'$PS1


# Keep no history outside of the session.
unset HISTFILE

# Ability to use homebrew v1 completions
#export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
# Hook new version of bash_completion, needed for K8 autocomplete.
# [[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh

# Ability to use homebrew v2 completions
#export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

# Hook new version of bash_completion, needed for K8 autocomplete.
#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"



#
# My Functions
#
function knife_prod_reader() { CHEF_ENV=prod_reader knife "$@"; }
function knife_prod_pipe() { CHEF_ENV=prod_pipe knife "$@"; }
function knife_prod_node() { CHEF_ENV=prod_node knife "$@"; }

function knife_stage_reader() { CHEF_ENV=stage_reader knife "$@"; }
function knife_stage_pipe() { CHEF_ENV=stage_pipe knife "$@"; }
function knife_stage_node() { CHEF_ENV=stage_node knife "$@"; }

function knife_automate() { CHEF_ENV=automate knife "$@"; }

function sha256sum() { shasum -a 256 "$@" ; } && export -f sha256sum

# Why is this here?
#function kubectl() { echo "+ kubectl $@"; command kubectl $@; }

#
# My Alias
#
#alias d2='cd /dev2/docker/repo1/docker/docker-ci-tool-stack-master'

alias d2='cd /Users/emanley/dev2/docker'

#alias dk3m='cd /dev2/k8/3rdParty/master'  
#alias dc='cd /dev2/chef'

alias dcdn='docker-compose stop'
alias dcup='docker-compose up 2>&1 | tee /Users/emanley/data/txt/dockerComposeStartLog.txt &'


#
# K8s Repos
#

alias  dk='cd /Users/emanley/dev2/k8'
alias dke='cd /Users/emanley/dev2/k8/eric/master/k8-examples'
alias dkv='cd /Users/emanley/dev2/k8/vmware'
alias dkvf='cd /Users/emanley/dev2/k8/vmware/forkz'
alias dkvm='cd /Users/emanley/dev2/k8/vmware/master'
alias dkvmp='cd /Users/emanley/dev2/k8/vmware/master/k8-examples/pez-vcenter'
alias dkvmc='cd /Users/emanley/dev2/k8/vmware/master/CaaSEnv'


alias dj='cd /Users/emanley/dev2/java'
alias dje='cd /Users/emanley/dev2/java/eric'
alias djvm='cd /Users/emanley/dev2/java/vmware/master'
alias djvf='cd /Users/emanley/dev2/java/vmware/forkz'

alias dyvp='cd /Users/emanley/dev2/yaml-yml/vmware/master/pez-vcenter'

#
# Docker Alias
#


alias di='docker images'
alias dgo='du -Pshx * 2>/dev/null'
alias dgo2='du -h | sort -h'

alias dp='docker ps'
alias dpa='docker ps -a'

alias e2epc='cd /Users/emanley/dev2/java/vmware/forkz/spring-petclinic'

#alias fcme='echo "Running foodcritic -t ~FC003 -t ~FC020 -t ~FC023 -t ~FC035 -t ~FC064 -t ~FC066 -t ~FC069 -t ~FC071 -t ~FC078 -f any ."; foodcritic -t ~FC003 -t ~FC020 -t ~FC023 -t ~FC035 -t ~FC064 -t ~FC066 -t ~FC069 -t ~FC071 -t ~FC078 -f any .'

alias hc='history -c'

alias lf='/Users/emanley/dev2/sh/launchFinderzVMW'

alias gconfigme='git config --global http.sslVerify false; git config --global user.name "ericm48"; git config --global user.email "me_manley@yahoo.com"; clear; git config --list'

alias gconfigmev='git config --global http.sslVerify false; git config --global user.name "ericm51"; git config --global user.email "emanley@vmware.com";git config --list'


#alias kc='rm ./Berksfile.lock; kitchen converge'
#alias kcd='kitchen converge developer'
#alias kdd='kitchen destroy developer'

#alias kl='cp .kitchen/logs/* /data/logs/kitchen;kitchen list'

#
# Wrapp the gcode script; #1 disable wildcard expansion, #2 run gcode, #3 enable wildcard expansion.
#
alias gcode='set -f;gcode';gcode(){ /Users/emanley/dev2/sh/gcode "$@";set +f; }


# git alias'
alias gpot='git push origin --tags'
alias ghash='git rev-parse --short HEAD'
alias ghashf='git log -1 --format="%H"'

alias ll='ls -latr'
alias me='cd /Users/emanley/dev2/sh'

#alias pme='cd ; . .bash_profile'
alias pme='source ~/.bash_profile'

alias me='cd /Users/emanley/dev2/sh'
alias mk='minikube'
alias mkpl='minikube profile list'

alias tfme='cd /Users/emanley/dev2/terraform/eric'

export BASH_COMPLETION_COMPAT_DIR='/usr/local/etc/bash_completion.d'
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Activates [sources] auto completion for kubectl
source <(kubectl completion bash)

# Load the .kubectl_aliases
[[ -f ~/.kubectl_aliases ]] && source ~/.kubectl_aliases

# Reset the k alias for autocompletion (both lines below).

alias k='kubectl'
complete -F __start_kubectl k

# Hook pyenv for python
eval "$(pyenv init --path)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk-342.0.0/path.bash.inc' ]; then . '/opt/google-cloud-sdk-342.0.0/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk-342.0.0/completion.bash.inc' ]; then . '/opt/google-cloud-sdk-342.0.0/completion.bash.inc'; fi

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/emanley/.sdkman"
#[[ -s "/Users/emanley/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/emanley/.sdkman/bin/sdkman-init.sh"

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
