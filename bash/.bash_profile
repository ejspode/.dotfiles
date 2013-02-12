# git
function git_dirty_status() {
  local dirty_status=$(git status --porcelain 2>/dev/null| wc -l)
  if test $dirty_status -gt 0; then
    echo "*"
  fi
}

function git_prompt() {
  local branch=$(git symbolic-ref HEAD --short 2> /dev/null)
  if test "$branch" != ""; then
    echo " ($branch)$(git_dirty_status)"
  fi
}


PS1="  λ \W\$(git_prompt): "

# Aliases

# git-aliases
alias gst="git status"
alias gco="git checkout"
alias gpnp="git pull origin $(git symbolic-ref HEAD --short) && git push origin $(git symbolic-ref HEAD --short)"
alias gpull="git pull origin $(git symbolic-ref HEAD --short)"
alias gpush="git push origin $(git symbolic-ref HEAD --short)"

# Copy current directory path into clipboard
alias cpwd="pwd | pbcopy"

# List all directories/files
alias la="ls -lA"
alias l="ls -l"

# Grab the local IP address
alias localip="ipconfig getifaddr en0"

# Use the Python's SimpleHTTPServer to serve files in the current dir
function serve() {
  echo "Starting the server from the location:"
  echo $PWD
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  python -m SimpleHTTPServer "$port"
}

function take() {
  mkdir -p $1
  cd $1
}

# Editor
export EDITOR="sub -n"

# Source z
source ~/z.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
