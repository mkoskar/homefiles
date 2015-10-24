# Source this file to finalize interactive login shell initialization.
# :Compatibility: POSIX

case $- in *i*) ;; *) return ;; esac
case $- in *l*) ;; *) return ;; esac

if [ "$TTY" = '/dev/tty1' ]; then
    up
    [ -e ~/bin/term.sh ] && . ~/bin/term.sh
fi
