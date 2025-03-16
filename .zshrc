# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

#--------------------------------------------------------------------
# PATH & ENVIRONMENT VARIABLES
#--------------------------------------------------------------------

# Python paths
export PATH="/opt/homebrew/bin/python:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

# Flutter & Android paths
export PATH="$PATH:/Users/kichinosukey-mba/development/flutter/bin"
export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin"
export PATH="$PATH:/Users/kichinosukey-mba/Library/Android/sdk/platform-tools"
export PATH="$PATH":"$HOME/.pub-cache/bin" 

# NPM global path
export PATH=$PATH:`npm bin -g`

# Java configuration
export JAVA_HOME=`/usr/libexec/java_home -v 20.0.2`

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" 
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" 

#--------------------------------------------------------------------
# EXTERNAL TOOL INITIALIZATION
#--------------------------------------------------------------------

# Pyenv initialization
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Direnv
eval "$(direnv hook zsh)"

# Jump
eval "$(jump shell --bind=z)"

# Jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Conda initialization
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup

# Google Cloud SDK
if [ -f '/Users/kichinosukey-mba/google-cloud-sdk/path.zsh.inc' ]; then 
    . '/Users/kichinosukey-mba/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/Users/kichinosukey-mba/google-cloud-sdk/completion.zsh.inc' ]; then 
    . '/Users/kichinosukey-mba/google-cloud-sdk/completion.zsh.inc'
fi

#--------------------------------------------------------------------
# ALIASES
#--------------------------------------------------------------------

# Shell aliases
alias szsh="source ~/.zshrc"
alias grep="grep --color=always"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport"
alias cppmt="./copy_env_var_to_clipboard.zsh"

# Python virtual environment
alias scvenv="source venv/bin/activate"
alias mkvenv="python3 -m venv venv"

# Media related
alias yt='yt-dlp -f "bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/best[ext=m4a]/best" --paths "~/Downloads/"' 
alias ytwav='yt-dlp -f "bestaudio" -x --audio-format wav --paths "~/Downloads/"'

# Application shortcuts
alias coffee='source /Users/kichinosukey-mba/coffee/venv/bin/activate && python /Users/kichinosukey-mba/coffee/main.py'
alias convert-hf="source /Users/kichinosukey-mba/llama.cpp/venv/bin/activate && python convert_hf_to_gguf.py"

#--------------------------------------------------------------------
# FUNCTIONS
#--------------------------------------------------------------------

# Image optimization function
optimize_image() {
  for input in "$@"; do
    for file in $(ls $input 2>/dev/null); do
      local output="${file%.*}-optimized.jpg"
      convert "$file" -strip -interlace Plane -quality 85 "$output"
    done
  done
}

# Custom directory listing
function lsd() {
  ls -ld $PWD/* | grep $@
}