# Copyright 2024 dah4k
# SPDX-License-Identifier: MIT-0

################################################################################
##                                BEGIN BASHRC
################################################################################

GIT_PROMPT_LOCATIONS="
    /etc/bash_completion.d/git-prompt.sh
    /etc/bash_completion.d/git-prompt
    /usr/share/git-core/contrib/completion/git-prompt.sh
"

for x in $GIT_PROMPT_LOCATIONS; do
    if [ -r $x ]; then
        source $x
        break
    fi
done

RED="\033[0;31m"
GREEN="\033[0;32m"          # DraculaGreen
YELLOW="\033[0;33m"         # DraculaYellow
BLUE="\033[0;34m"           # DraculaPurple
MAGENTA="\033[0;35m"        # DraculaPink
NORM="\033[0m"
BRIGHT_GREEN="\033[0;92m"
BRIGHT_YELLOW="\033[0;93m"
BRIGHT_MAGENTA="\033[0;95m"

if [ $(type -t __git_ps1) ]; then
    # Function __git_ps1 is available
    export PS1="$BLUE\A $BRIGHT_MAGENTA\w$BRIGHT_GREEN \$(__git_ps1 \"git:($BRIGHT_YELLOW%s$BRIGHT_GREEN)\")$NORM\n% "
else
    # Fallback to `git`
    export PS1="$BLUE\A $BRIGHT_MAGENTA\w$BRIGHT_GREEN git:($BRIGHT_YELLOW\$(git symbolic-ref --short HEAD 2>/dev/null)$BRIGHT_GREEN)$NORM\n% "
fi

## Disable accidental C-s (XOFF) and C-q (XON) flow controls
stty -ixoff -ixon

[ -r $HOME/.alias ] && source $HOME/.alias

################################################################################
##                                 END BASHRC
################################################################################
