#!/bin/bash

declare -A LAPTOP=( [name]='eDP-1' [path]='/sys/class/drm/card0-eDP-1' )
declare -A DESKTOP=( [name]='DP-2-1' [path]='/sys/class/drm/card0-DP-5' )
declare -A TV=( [name]='DP-2-2' [path]='/sys/class/drm/card0-DP-6' )

declare MODE_FILE="$XDG_RUNTIME_DIR/use_tv"

printf 'Entering main loop\n'
while :; do
    {
        DESKTOP['status']="$(< "${DESKTOP[path]}/status")"
    } 2> /dev/null

    SETUP_BEFORE="$(xrandr)"
    if [ ! -e "${DESKTOP[path]}" ] \
       && [ ! -e "${TV[path]}" ]; then
        OUTPUT_MESSAGE='Set output to laptop only...'
        xrandr --output "${LAPTOP[name]}" --auto \
               --output "${DESKTOP[name]}" --off \
               --output "${TV[name]}" --off
    elif [[ "${DESKTOP[status]}" == 'connected' ]]; then
        if [ ! -e "$MODE_FILE" ]; then
            OUTPUT_MESSAGE='Set output to desktop only...'
            xrandr --output "${LAPTOP[name]}" --off \
                   --output "${DESKTOP[name]}" --auto \
                   --output "${TV[name]}" --off
        else
            OUTPUT_MESSAGE='Set output to desktop and TV...'
            xrandr --output "${LAPTOP[name]}" --off \
                   --output "${DESKTOP[name]}" --auto \
                   --output "${TV[name]}" --mode '1680x1050' --right-of "${DESKTOP[name]}"
        fi
    fi
    SETUP_AFTER="$(xrandr)"
    if [[ "$SETUP_BEFORE" != "$SETUP_AFTER" ]]; then
        printf '%s\n' "$OUTPUT_MESSAGE"
    fi
    sleep 2
done
