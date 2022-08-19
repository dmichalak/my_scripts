EDITOR=vim

export CLICOLOR=1

BLACK="\[\e[0;30m\]"
DARK_GRAY="\[\e[1;30m\]"
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
PURPLE="\[\e[1;34m\]"
BLUE="\[\e[0;34m\]"
LIGHT_BLUE="\[\e[1;34m\]"
GREEN="\[\e[0;32m\]"
LIGHT_GREEN="\[\e[1;32m\]"
CYAN="\[\e[0;36m\]"
LIGHT_CYAN="\[\e[1;36m\]"
LIGHT_RED="\[\e[1;31m\]"
PURPLE="\[\e[0;34m\]"
LIGHT_PURPLE="\[\e[1;35m\]"
BROWN="\[\e[0;33m\]"
LIGHT_GRAY="\[\e[0;37m\]"
WHITE="\[\e[1;37m\]"

export PS1="$LIGHT_GRAY\t$LIGHT_GRAY-$GREEN@$LIGHT_GRAY\h $LIGHT_BLUE->/\W/$YELLOW \$ $LIGHT_GRAY"
export PATH=/usr/local/cuda-11.7/bin:/opt/relion/build/bin:/opt/dynamo/matlab/bin:/home/michalakdj/local/repos/IsoNet/bin:/home/michalakdj/.local/UCSF-Chimera64-1.16/bin:/home/michalakdj/.cargo/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/local/cuda-11.7/lib64:$LD_LIBRARY_PATH #:/opt/dynamo/MCRLinux/runtime/glnxa64:/opt/dynamo/MCRLinux/bin/glnxa64:/opt/dynamo/MCRLinux/sys/os/glnxa64:/usr/lib/x86_64-linux-gnu/libstdc++.so.6
export PYTHONPATH=/home/michalakdj/local/repos/:$PYTHONPATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export MCR_CACHE_ROOT=/home/michalakdj/local/mcr_cache


#####################################################
######## User specific aliases and functions ########
#####################################################
alias ls='ls -GFh --color --group-directories-first'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

alias sdynamo='source ${DYNAMO_ROOT}/dynamo_activate_linux_shipped_MCR.sh'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/michalakdj/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/michalakdj/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/michalakdj/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/michalakdj/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

set_title() {
	echo -ne "\033]0;${1}\007";
}
alias title=set_title
