#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

product_version=$(sw_vers -productVersion)
os_vers=( ${product_version//./ } )
os_vers_minor="${os_vers[1]}"

if [[ ${os_vers_minor} -ge 15 ]]; then
  current_track="#($CURRENT_DIR/scripts/current_track_music_app.sh)"
else
  current_track="#($CURRENT_DIR/scripts/current_track_itunes_app.sh)"
fi

current_track_interpolation="\#{current_track}"

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local string=$1
	local all_interpolated=${string/$current_track_interpolation/$current_track}
	echo $all_interpolated
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main

