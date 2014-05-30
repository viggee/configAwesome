# Check for an interactive session
[ -z "$PS1" ] && return


prompt_command () {
    local rts=$?
    local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
# pwd max length L, prefix shortened pwd with m
    local L=30 m='<'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="\[\033[0;36m\]${m}\[\033[0;37m\]${w:$n}\[\033[0m\]" ; } \
    ||   local w="\[\033[1;34m\]${w}\[\033[0m\]"
# different colors for different return status
    [ $rts -eq 0 ] && \
    local p="\[\033[1;32m\]▶\[\033[m\]" || \
    local p="\[\033[1;31m\]▶\[\033[m\]"
    PS1="${w} ${p} "
}
PROMPT_COMMAND=prompt_command

alias vdr='vdr -P xineliboutput -s "killall vdr"'

# modified commands
alias sudo='sudo '
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
#alias df='dfc'
#alias du='du -c -h'
alias du='cdu -idh'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'
#alias pacman='pacman-color'
alias pcmanfm='dbus-launch pcmanfm'

# new commands
alias rmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument

# privileged access
#if [ $UID -ne 0 ]; then
#    alias sudo='sudo '
#    alias scat='sudo cat'
#    alias svim='sudo vim'
#    alias root='sudo su'
#    alias reboot='sudo reboot'
#    alias halt='sudo halt'
#    alias update='sudo pacman -Su'
#    alias netcfg='sudo netcfg2'
#fi

# ls
eval $(dircolors -b)
alias ls='ls -lhF --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
#alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -i'

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

eval $(dircolors -b $HOME/.dircolors)

orphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo no orphans to remove
  else
    sudo pacman -Rs $(pacman -Qdtq)
  fi
}

# Extract Files
extract() {
 if [ -f $1 ] ; then
     case $1 in
         *.tar.bz2)   tar xvjf $1    ;;
         *.tar.gz)    tar xvzf $1    ;;
         *.tar.xz)    tar xvJf $1    ;;
         *.bz2)       bunzip2 $1     ;;
         *.rar)       unrar x $1     ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xvf $1     ;;
         *.tbz2)      tar xvjf $1    ;;
         *.tgz)       tar xvzf $1    ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
         *.xz)        unxz $1        ;;
         *.exe)       cabextract $1  ;;
         *)           echo "\`$1': unrecognized file compression" ;;
     esac
 else
     echo "\`$1' is not a valid file"
 fi
}

# Complete
complete -cf sudo
#
complete -cf gksudo
#
complete -cf man
complete -cf info
complete -cf pkill
complete -cf kill
complete -cf killall
complete -cf gdb
complete -cf time
complete -cf watch

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xdefaults | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi
