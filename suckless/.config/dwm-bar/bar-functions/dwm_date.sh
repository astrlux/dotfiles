#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_date () {
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s" "$(date "+%a %b %d %r")"
    else
        printf "DAT %s" "$(date "+%a %b %d %r")"
    fi
}

dwm_date
