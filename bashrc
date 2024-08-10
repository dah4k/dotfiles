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
BLUE="\033[0;34m"           # DraculaPurple
PURPLE="\033[0;35m"         # DraculaPink
NORM="\033[0m"

if [ $(type -t __git_ps1) ]; then
    # Function __git_ps1 is available
    export PS1="$BLUE\A $RED\u💀\h$BLUE:$NORM\w$BLUE \$(__git_ps1 \"($PURPLE%s$BLUE)\")$NORM\n% "
else
    # Fallback to `git` command
    export PS1="$BLUE\A $RED\u💀\h$BLUE:$NORM\w$BLUE ($PURPLE\$(git symbolic-ref --short HEAD 2>/dev/null)$BLUE)$NORM\n% "
fi

[ -r $HOME/.alias ] && source $HOME/.alias

################################################################################
##                                 END BASHRC
################################################################################
