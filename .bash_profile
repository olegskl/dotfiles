# ---------------- Escape sequences -----------------
ESC=$(printf '\[\033')
red=$(tput setaf 1)
none=$(tput sgr0)

# -------------------- Homebrew ---------------------
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

# ----------------- ng-boilerplate ------------------
# helper for ng-boilerplate initialization
# https://github.com/ngbp/ngbp
ngbp() {
    fromRepo=git://github.com/joshdmiller/ng-boilerplate
    toDir=$1

    # Update global dependencies:
    # sudo npm -g update grunt-cli karma bower

    # Shallow clone the boilerplate from remote repo:
    if git clone "$fromRepo" --depth=1 "$toDir" ; then
        # Navigate (quietly) to the project directory:
        pushd "$toDir" > /dev/null

        # Install local dependencies:
        npm install && \
        bower install && \
        # Do the initial build and test:
        grunt build && \
        # Force-remove recursively the .git directory:
        rm -rf .git && \
        # Empty the changelog file:
        echo -n > CHANGELOG.md

        # Return (quietly) to the original directory:
        popd > /dev/null
    fi
}

# ---------------------- Git ------------------------
# extracts the name of the current branch in format:
# " git:branchname"
git_branch() {
    git branch 2> /dev/null |
        sed -e '/^[^*]/d' -e "s/* \(.*\)/ git:\1/"
}

# --------------- Prompt statement ------------------
# http://ss64.com/bash/syntax-prompt.html
# oregu ~/my/dir/ $
export PS1="\u \W\$(git_branch) \$ "

# -------------------- Locale -----------------------
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
