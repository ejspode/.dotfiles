PS1="  λ \W: "
# Aliases
# Copy current directory path into clipboard
alias cpwd="pwd | pbcopy"

# List all directories/files
alias la="ls -lA"
alias l="ls -l"

# Basic copy and paste
alias copy="pbcopy"
alias paste="pbpaste"

# Grab the local IP address
alias localip="ipconfig getifaddr en1"

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
