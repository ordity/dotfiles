#!/bin/sh
maim -d 1 -Bs | xclip -selection clipboard -t image/png; xclip -selection clipboard -t image/png -o > ~/Screenshots/$(date +%F-%H:%M:%S).png
