# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# check on which os we are

if [ $(type -t termux-setup-storage) ]; then
	OS_ID="termux"
else
	if [ -f /etc/os-release ]; then
		OS_ID=$(. /etc/os-release && echo ${ID})
	else
		OS_ID=Unknown
	fi
fi


export OS_ID

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ ! -z $(type -t tput) ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# source nerd_char
[ -f ${HOME}/.nerdfont_char ] && source ${HOME}/.nerdfont_char

# Function to generate PS1 after CMDs
PROMPT_COMMAND=prompt::PS1

if [ "$color_prompt" = yes ]; then
	ESC="\[\e["
	END="\]"
	RST="${ESC}0m${END}"

	PROMPT_BLACK="${ESC}30m${END}"
	PROMPT_RED="${ESC}31m${END}"
	PROMPT_GREEN="${ESC}32m${END}"
	PROMPT_YELLOW="${ESC}33m${END}"
	PROMPT_ORANGE="${ESC}38;5;208m${END}"
	PROMPT_BLUE="${ESC}34m${END}"
	PROMPT_PURPLE="${ESC}35m${END}"
	PROMPT_CYAN="${ESC}36m${END}"
	PROMPT_WHITE="${ESC}37m${END}"
	PROMPT_BOLD="${ESC}01m${END}"

	WORK_DIR_COLOR="${PROMPT_BOLD}${PROMPT_BLUE}"
	USER_COLOR="${PROMPT_BOLD}${PROMPT_ORANGE}"
	COMMAND_COLOR=""
	PS0="${RST}"
fi

if [ ${SSH_CLIENT} ]; then
	SSH_PART="-(${PROMPT_RED}${LOGO_SSH} ${SSH_CLIENT/ */}${RST})"
fi

# set shebang because \$ don't work
[ $(id -u) -eq 0 ] && SHEBANG="#" || SHEBANG="$"

# set modified PROMPT_VARIABLE according to which os we are
case ${OS_ID} in
	termux)
		OS_EMOJI="${LOGO_TERMUX:-@}"
		OS_COLOR="${PROMPT_CYAN}"
		USER_COLOR="${PROMPT_BOLD}${PROMPT_GREEN}"
		;;
	ubuntu)
		OS_EMOJI="${LOGO_UBUNTU:-@}"
		OS_COLOR="${PROMPT_YELLOW}"
		USER_COLOR="${PROMPT_BOLD}${PROMPT_ORANGE}"
		;;
	debian)
		OS_EMOJI="${LOGO_DEBIAN:-@}"
		OS_COLOR="${PROMPT_RED}"
		USER_COLOR="${PROMPT_BOLD}${PROMPT_PURPLE}"
		;;
	kali)
		OS_EMOJI="${LOGO_KALI:-@}"
		OS_COLOR="${PROMPT_GREEN}"
		USER_COLOR="${PROMPT_BOLD}${PROMPT_RED}"
		;;
	alpine)
		OS_EMOJI="${LOGO_ALPINE:-@}"
		OS_COLOR="${PROMPT_CYAN}"
		USER_COLOR="${PROMPT_BOLD}${PROMPT_BLUE}"
		;;
	None)
		OS_EMOJI="@"
		OS_COLOR=""
		USER_COLOR=""
		;;
esac

function	prompt::PS1() {
	local	EXIT=${?}
	local	status_color

	PS1=""

	case ${EXIT} in
		0)		status_color="${PROMPT_GREEN}" ;;
		130)	status_color="${PROMPT_ORANGE}" ;;
		*)		status_color="${PROMPT_RED}" ;;
	esac
	case ${#EXIT} in
		1)	EXIT=" ${EXIT} " ;;
		2)	EXIT=" ${EXIT}" ;;
		*)	EXIT="${EXIT}" ;;
	esac

	EMOJI_PART="${OS_COLOR}${OS_EMOJI}${RST}"

	FIRST_LINE="╔[${WORK_DIR_COLOR}\w${RST}]${SSH_PART}-(\t)\n"
	SECOND_LINE="╚[${USER_COLOR}\u@\h${RST}]-(${EMOJI_PART})-(${status_color}${EXIT}${RST})"

	PS1="${FIRST_LINE}${SECOND_LINE} ${SHEBANG}${COMMAND_COLOR} "
}

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
	*) ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# set tab on bash debug
PS4="    "
tabs 4
