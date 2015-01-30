# ~/.profile
# - executed by the command interpreter for login shells
# - not read by bash(1), if ~/.bash_profile or ~/.bash_login exists

umask 022

[ -z "$_PATH" ] && export _PATH="$PATH"
PATH="$HOME/.npm-global/bin:$_PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/opt/bin:$PATH"
PATH="$HOME/bin:$PATH"
export PATH

export HOSTNAME=$(hostname)
export LANG='en_US.UTF-8'
export LC_COLLATE='C'
export LD_LIBRARY_PATH="$HOME/opt/lib"

export TMPDIR="/tmp/$USER"
[ -d "$TMPDIR" ] || mkdir -p -m 700 "$TMPDIR"

export JDK_HOME='/usr/lib/jvm/default'
export JAVA_HOME=$JDK_HOME
export IDEA_JDK='/usr/lib/jvm/java-7-jdk'
export _JAVA_AWT_WM_NONREPARENTING=1

export ASPROOT="$HOME/.asp"
export BROWSER='b'
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
export EDITOR='e'
export GRADLE_HOME='/usr/share/java/gradle'
export GREP_COLORS='sl=:cx=:mt=41:fn=36:ln=33:bn=33:se=:ne'
export LESS='-MRS#3ci'
export LESSHISTFILE='-'
export LESSOPEN='| highlight --quiet -O xterm256 -s bluegreen %s'
export MANPAGER='manpg'
export ORACLE_HOME='/opt/instantclient'
export PACKER_CACHE_DIR="$HOME/.packer_cache"
export PAGER='pg'
export VDPAU_DRIVER='va_gl'
export XAUTHORITY="$HOME/.Xauthority"

eval "$(TERM=ansi dircolors)"

[ -e ~/bin/ssh-agent.sh ] && . ~/bin/ssh-agent.sh

# since GnuPG 2.1.0 gpg-agent is started automatically
#[ -e ~/bin/gpg-agent.sh ] && . ~/bin/gpg-agent.sh
