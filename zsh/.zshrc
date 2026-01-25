# ============================================================================
# OS DETECTION
# ============================================================================
if [[ "$OSTYPE" == "darwin"* ]]; then
    export IS_MAC=true
    export IS_LINUX=false
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export IS_MAC=false
    export IS_LINUX=true
fi

# ============================================================================
# LOCALE SETTINGS
# ============================================================================
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ============================================================================
# SHELL APPEARANCE
# ============================================================================
# Starship prompt
eval "$(starship init zsh)"

# Powerlevel10k (if needed)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# PATH CONFIGURATION
# ============================================================================
# Local binaries (if directory exists)
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
[[ -d "$HOME/go" ]] && export GOPATH="$HOME/go"

# pnpm
if [[ "$IS_MAC" == true ]]; then
    export PNPM_HOME="/Users/varich/Library/pnpm"
elif [[ "$IS_LINUX" == true ]]; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ============================================================================
# TOOL INITIALIZATIONS
# ============================================================================

# Homebrew
if [[ "$IS_LINUX" == true ]] && [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$IS_MAC" == true ]] && [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$IS_MAC" == true ]] && [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# NVM (if installed)
if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Docker CLI completions (macOS)
if [[ "$IS_MAC" == true ]] && [[ -d "$HOME/.docker/completions" ]]; then
    fpath=($HOME/.docker/completions $fpath)
fi

# ============================================================================
# ALIASES - NAVIGATION
# ============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# ============================================================================
# ALIASES - FILE LISTING
# ============================================================================
alias ll='ls -lart'
alias la='ls -A'

# ============================================================================
# ALIASES - FILE OPERATIONS
# ============================================================================
alias count='find . -type f | wc -l'
alias f='find . -name'

# ============================================================================
# ALIASES - FILE PERMISSIONS
# ============================================================================
alias mx='sudo chmod a+x'
alias 000='sudo chmod -R 000'
alias 644='sudo chmod -R 644'
alias 666='sudo chmod -R 666'
alias 755='sudo chmod -R 755'
alias 777='sudo chmod -R 777'

# ============================================================================
# ALIASES - TEXT PROCESSING
# ============================================================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ============================================================================
# ALIASES - HISTORY
# ============================================================================
alias h='history'
alias hg='history | grep'

# ============================================================================
# ALIASES - EDITORS
# ============================================================================
alias v='vim'
alias c='code'
alias nano='nano -c -i -m -S'

if [[ "$IS_MAC" == true ]]; then
    alias subl='open -b com.sublimetext.4'
elif [[ "$IS_LINUX" == true ]]; then
    alias subl='subl'
fi

# ============================================================================
# ALIASES - GIT
# ============================================================================
alias gcom="git commit --message"
alias gs="git status"
alias gcfg="cat .git/config"
alias gcfgw="git config user.name 'Vitalii Variichuk' && git config user.email v.variichuk@targer.com.ua"

# ============================================================================
# ALIASES - NODE
# ============================================================================
alias ndb='node --inspect --watch'

# ============================================================================
# ALIASES - NPM
# ============================================================================
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nt='npm test'
alias ns='npm start'
alias nb='npm run build'
alias nd='npm run dev'
# alias nshttp='sudo PORT=80 npm start'

# ============================================================================
# ALIASES - PNPM
# ============================================================================
alias pn='pnpm'
alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm run'
alias pt='pnpm test'
alias pstart='pnpm start'
alias pdev='pnpm dev'
alias pbuild='pnpm build'

# ============================================================================
# ALIASES - DOCKER COMPOSE
# ============================================================================
alias dcu='docker-compose up -d'
alias dcub='docker-compose up -d --build'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'

# ============================================================================
# ALIASES - DOCKER CONTAINER MANAGEMENT
# ============================================================================
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dbash='docker exec -it'
alias drun='docker run -it --rm'

# ============================================================================
# ALIASES - DOCKER CLEANUP
# ============================================================================
alias dprune='docker system prune -af'
alias drmi='docker rmi $(docker images -q -f dangling=true)'
alias drmc='docker rm $(docker ps -aq -f status=exited)'

# ============================================================================
# ALIASES - NETWORK
# ============================================================================
alias ping='ping -c 5'
alias myip='curl https://ipinfo.io/ip; echo'
alias ipinfo='curl https://ipinfo.io/json; echo'

if [[ "$IS_MAC" == true ]]; then
    alias localip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
    alias nwtest="networkQuality -v"
elif [[ "$IS_LINUX" == true ]]; then
    alias localip="hostname -I | awk '{print \$1}'"
fi

# ============================================================================
# ALIASES - DEVELOPMENT SERVERS
# ============================================================================
alias liveserver='npx live-server'
alias pyserve='python3 -m http.server 1487'

# ============================================================================
# ALIASES - ENVIRONMENT
# ============================================================================
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime='date +"%d-%m-%Y %T"'
alias resource='source ~/.zshrc && echo "Reloaded!"'

# ============================================================================
# FUNCTIONS
# ============================================================================

# Squash last N commits
gsqf() {
    if [ $# -eq 0 ]; then
        echo "Usage: gsqf <number_of_commits>"
        return 1
    fi
    git rebase -i HEAD~$1
}
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/varich/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
