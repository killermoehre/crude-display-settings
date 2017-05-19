#!/bin/bash

if [ -e "$XDG_RUNTIME_DIR/use_tv" ]; then
    rm "$XDG_RUNTIME_DIR/use_tv"
else
    touch "$XDG_RUNTIME_DIR/use_tv"
fi
