#!/bin/sh
maim -sok | xclip -selection clipboard -t image/png; xclip -selection clipboard -t image/png -o > ~/Screenshots/$(date +%F-%H:%M:%S).png
