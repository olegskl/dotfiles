# ---------------- Escape sequences -----------------
ESC=$(printf '\033')

# ---------------------- NVM ------------------------
# PATH variables for Node.js installed locally in NVM
# (checking if NVM is installed first)
if [ -s ~/.nvm/nvm.sh ]; then
    . ~/.nvm/nvm.sh # This loads NVM
fi

# -------------------- Homebrew ---------------------
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

# ---------------------- Git ------------------------
# extracts the name of the current branch in format:
# " git:branchname"
git_branch() {
    git branch 2> /dev/null |
        sed -e '/^[^*]/d' -e "s/* \(.*\)/ git:${ESC}[4m\1${ESC}[0m/"
}

# --------------- Prompt statement ------------------
# http://ss64.com/bash/syntax-prompt.html
# oregu ~/my/dir/ $
export PS1="\u \w\$(git_branch) \$ "

# -------------------- Locale -----------------------
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
