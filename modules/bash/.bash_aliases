#!/bin/bash

# utils functions

## APT ALL
function	aptall()
{
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove --purge -y
	sudo do-release-upgrade
	if [ -f /var/run/reboot-required ]; then
		printf "Reboot required, rebooting in...\n"
		printf "3...\r"
		sleep 1
		printf "2.. \r"
		sleep 1
		printf "1.  \n"
		sleep 1
		sudo shutdown --reboot now
	fi
}

## pentest utils

function	printFeedHelp()
{
	printf "Usage: feed EXEC_NAME TITLE COMMAND\n"
	[ ! -z "$1" ] && printf "ERROR: $1\n"
}

function	feed()
{
	[ -z "$1" ] && printFeedHelp "need exec name" && return
	[ -z "$2" ] && printFeedHelp "need title" && return
	[ -z "$3" ] && printFeedHelp "need command" && return

	local	feed_name=$1
	local	feed_title=$2
	local	feed_command=$3
	local	feed_file_path="${HOME}/.backup"

	[ ! -d "${feed_file_path}" ] && mkdir ${feed_file_path}

	feed_file_path="${feed_file_path}/${feed_name}_command.md"

	if [ ! -f "${feed_file_path}" ]; then
		printf "# ${feed_name}\n\n" > ${feed_file_path}
		printf "## ${feed_title}\n" >> ${feed_file_path}
		printf "\`${feed_command}\`\n\n" >> ${feed_file_path}
	else
		printf "## ${feed_title}\n" >> ${feed_file_path}
		printf "\`${feed_command}\`\n\n" >> ${feed_file_path}
	fi
}

## Docker
function	dockc()
{
	docker system prune -af
	docker network prune -f
	docker volume prune -f
}

# Alias

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	LS_COLOR=y
fi

# Alias

## ENABLE ALIAS FOR SUDO COMMAND
alias sudo="sudo "

## Ip
alias ip="ip --color=auto"

## Ls
export LS_OPTIONS="-vhF"
if [ "${LS_COLOR}" == "y" ]; then
	LS_OPTIONS="--color=auto ${LS_OPTIONS}"
fi
alias ls="ls ${LS_OPTIONS}"
alias ll="ls -oA"
alias la="ls -la"
alias l="ls"

## Apt
export APT_OPTIONS="-y"
alias apt="apt ${APT_OPTIONS}"

## batcat
if [ -f "/usr/bin/batcat" ]; then
	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
	alias cat="batcat"
	function batdiff()
	{
		git diff --name-only --relative --diff-filter=d | xargs batcat --diff
	}
fi

## John
alias john="/usr/local/bin/john"

## bash
: ' debug_bash
${1}    cmd to debug
return  return debug in  in ${PWD}/exec.log. if DEBUG_OUT is set, ouput
        debug in ${PWD}/DEBUG_OUT
'
function	debug_bash()
{
	local	cmd="${@}"
	local	options="-x"
	if [ -z "${DEBUG_OUT}" ];then
		local debug_file="exec.log"
	else
		local debug_file=${DEBUG_OUT}
	fi

	bash "${options}" ${cmd} 2>${debug_file}
}

TREE_OPT="--metafirst -I .git -apugh -D --timefmt '%x %X'"
# --metafirst	: make metadata appear first, that keep the ascii tree clean :)
# -I			: ignore dirs (like .git ones)
# -a			: all files
# -p			: print permission
# -u			: print user owner
# -g			: print group owner
# -h			: size in human readable
# -D			: display the last modified
# --timefmt		: print date in format
# %x			: current day padded with zero's
# %X			: current time padded with zero's
alias ttree="tree ${TREE_OPT}"
http_tree='-H . -o ./index.html && sleep 1 && xdg-open ./index.html && read -s -n 1 && rm ./index.html'
# -H			: format output as html
# -o output in file instead of stdout

alias httree="ttree ${http_tree}"
alias htree="tree ${http_tree}"

alias sb="source ~/.bashrc"
