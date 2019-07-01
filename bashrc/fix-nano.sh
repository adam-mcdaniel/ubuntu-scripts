# Nano has a problem with scrolling.

# Whenever you scroll without pageup or pagedown,
# it displays utter garbage in the terminal

# To fix, run these two commands
stty sane
export TERM="linux"
