#!/bin/bash

# utils functions

## APT ALL
function aptall() {
	sudo apt update
	sudo apt upgrade
	sudo apt autoremove
	if [ -f /var/run/reboot-required ]; then
		printf "Reboot required, rebooting in...\n"
		printf "3...\r"
		sleep 1
		printf "2.. \r"
		sleep 1
		printf "1.  \n"
		sleep 1
		shutdown --reboot now
	fi
}

## pentest utils

function printFeedHelp(){
	printf "Usage: feed EXEC_NAME TITLE COMMAND\n"
	[ ! -z "$1" ] && printf "ERROR: $1\n"
}

function feed() {
	[ -z "$1" ] && printFeedHelp "need exec name" && return
	[ -z "$2" ] && printFeedHelp "need title" && return
	[ -z "$3" ] && printFeedHelp "need command" && return

	feed_name=$1
	feed_title=$2
	feed_command=$3
	feed_file_path="${HOME}/.backup"

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	LS_COLOR=y
fi

# Alias

## ENABLE ALIAS FOR SUDO COMMAND
alias sudo="sudo "

## IP
alias ip="ip --color=auto"

## LS
export LS_OPTIONS="-vhF"
if [ "${LS_COLOR}" == "y" ]; then
	LS_OPTIONS="--color=auto ${LS_OPTIONS}"
fi
alias ls="ls ${LS_OPTIONS}"
alias ll="ls -oA"
alias la="ls -la"
alias l="ls"

## APT
export APT_OPTIONS="-y"
alias apt="apt ${APT_OPTIONS}"

## batcat
if [ -f "/usr/bin/batcat" ]; then
	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
	alias cat="batcat --pager=never"
	function batdiff()
	{
		git diff --name-only --relative --diff-filter=d | xargs batcat --diff
	}
fi

## John
alias john="/usr/local/bin/john"
