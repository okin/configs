alias ll='ls -ahl'
alias lt='ls -trhl'

# Listing directories below
# by @fiktionist - https://twitter.com/fiktionist/status/286824346918469632
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

# Git specific settings
alias gss='git status'
alias gcm='git commit -m'
alias gl='git log'

