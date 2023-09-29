
# ~/.bashrc
#
#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

### EXPORT
export TERM="xterm-256color"              # getting proper colors
export EDITOR=vim
export FZF_CTRL_T_COMMAND="fd --hidden"


### Bake
export BAKE_HOME=`pwd`/bake 
export PATH=$PATH:$BAKE_HOME
export PYTHONPATH=$PYTHONPATH:$BAKE_HOME

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

#add pywall to path
export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.emacs.d/bin/"

# Navigation
up () {
  local d=""
  local limit="$1"

  # Set default if no option or invalid option supplied
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
      limit=1
  fi

  # Go level to the directory upto specified level
  for((i=1; i<=limit; i++)); do
    d="../$d"
  done

  # Perform cd. Show erro if cd fails

  if ! cd "$d"; then
      echo "Couldn't go up $d levels";
  fi

}


force_color_prompt=yes

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

### PROMPT
# This is commented out if using starship prompt
# PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#list
# alias ls='ls --color=auto'
    # alias la='ls -a'
    # alias ll='ls -lah'
# alias l='ls -lhtr'
# alias l.="ls -A | egrep '^\.'"

alias ls='exa --group-directories-first'
alias la='exa -ax --group-directories-first'
alias l2='exa -lT -L2 --group-directories-first'
alias l3='exa -lT -L3 --group-directories-first'
alias l4='exa -lT -L3 --group-directories-first'
alias l='exa -l --group-directories-first'
alias d='exa -D'
alias ll='exa -la --group-directories-first'
alias ka="killall"

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll="yay -Syu --noconfirm"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#Create Heirarchical directories with mkdir
alias mkdir="mkdir -pv"

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

#ps
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bashrc
alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
#copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
#alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && source ~/.zshrc'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

#quickly kill conkies
alias kc='killall conky'
alias kp='killall pamac'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#devour windows
alias jpy="devour jupyter notebook"
alias vlc="devour vlc"
alias mpv="devour mpv"
alias evince="devour evince"

#Shortcut to files
alias va="nvim ~/.vimrc"
alias xm="nvim ~/.xmonad/xmonad.hs"
alias ba="nvim ~/.bashrc"
alias zr="nvim ~/.config/zathura/zathurarc"

#config shortcuts
alias al="nvim ~/.config/alacritty/alacritty.yml"
alias nc="nvim ~/.config/nvim/init.lua"
alias mrc="nvim ~/.config/mutt/muttrc"
alias p="nvim ~/.config/polybar/config.ini"

# fuzzy find files and open in vim
alias vimff="vim -o \`fzf\`"

#Open Courses
alias biosec="cd ~/IITD/Courses/SIL775/"
alias os="cd ~/IITD/Courses/COL633_OS/"
alias nss="cd ~/IITD/Courses/SIL765_NSS/"
alias minorp="cd ~/IITD/Courses/MinorProj/"

#Save more history
unset HISTFILESIZE
HISTSIZE=3000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND

shopt -s histappend

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize  # expand aliases


#navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'

#fuzzy finder preview window for files
alias pf="fzf --preview='bat --color=always --style=numbers {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlightdm="sudo nano /etc/lightdm/lightdm.conf"
alias npacman="sudo nano /etc/pacman.conf"
alias ngrub="sudo nano /etc/default/grub"
alias nconfgrub="sudo nano /boot/grub/grub.cfg"
alias nmkinitcpio="sudo nano /etc/mkinitcpio.conf"
alias nmirrorlist="sudo nano /etc/pacman.d/mirrorlist"
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://bike.seedhost.eu/arcolinux/"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# default applications for certain files
alias open="devour xdg-open"
alias z="devour zathura"
alias brave="devour brave"
alias pcmanfm="devour pcmanfm"
alias thunar="devour thunar"
alias vlc="devour vlc"
alias v="/usr/bin/vim"
alias nv="nvim"
alias vim="nvim"
alias nmm="neomutt"
#alias dmenu="dmenu -sb '#8a2be2' -shb '#ffd700' -shf '#342860' -nhf '#8a2be2' -nhb '#133337' -h 30 -fn 'NotoMonoRegular:regular:pixelsize=16'"


# alias for httpd 
alias sstart="sudo /usr/local/apache2/bin/apachectl start"
alias sstop="sudo /usr/local/apache2/bin/apachectl stop"

# alias for listing only directories or non-directories
alias odir="ls -lah | grep ^d"
alias ndir="ls -lah | grep -v ^d"

#source files
alias sbr="source ~/.bashrc"

# ipython
alias ipy="ipython"

#sioyek
alias s="devour sioyek"

#ascii alias
alias aii="echo ascii | xargs -r man -Tpdf | zathura -"



# Default C code
default_c_code() {
    if [[ "$1" == *.c ]]; then
        echo -e "#include <stdio.h>\n\nint main(void)\n{\n\n\treturn 0;\n}" > "$1"
    elif [[ "$1" == *.cpp ]]; then
        echo -e "#include <iostream>\nusing namespace std;\n\nint main(void)\n{\n\n\treturn 0;\n}" > "$1"
    else
        touch "$1"
    fi
}

alias touch="default_c_code"

# for git bare repo dotfile management
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot extract from ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

function f { v="$1" && exa | awk -v VAR=$v 'NR==VAR {print $0}' | xargs -I {} devour $2 "{}";}
export -f f

#vim mode in shell
set -o vi

#stop overwriting using >
#set -o noclobber

#for syntax highlighting man pages
export PAGER="most"

# colorscript random

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal


source /usr/share/fzf/key-bindings.bash # For binding keys like ctrl-r(history) with fzf
source /usr/share/fzf/completion.bash

eval "$(starship init bash)"
