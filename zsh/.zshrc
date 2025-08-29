# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH=~/.console-ninja/.bin:$PATH
eval "$(starship init zsh)"

# ===== My aliases =====
alias ll='ls -lart'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias h='history'
alias nano='nano -c -i -m -S'
alias nwtest="networkQuality -v"

# ===== Git shortcuts =====
alias gs="git status"
alias gamp="git add . && git commit --amend --no-edit && git push --force-with-lease"
alias gcfg="cat .git/config"
alias gcfgw="git config user.name 'Vitalii Variichuk' && git config user.email v.variichuk@targer.com.ua"
alias gsq1='git rebase -i HEAD~1'
alias gsq2='git rebase -i HEAD~2'
alias gsq3='git rebase -i HEAD~3'
alias gsq4='git rebase -i HEAD~4'
alias gsq5='git rebase -i HEAD~5'
alias gsq6='git rebase -i HEAD~6'
# Squash last N commits with function
gsqf() {
    if [ $# -eq 0 ]; then
        echo "Usage: gsquash <number_of_commits>"
        return 1
    fi
    git rebase -i HEAD~$1
}

# ===== File searching & counting =====
alias count='find . -type f | wc -l'
alias f='find . -name'
alias h='history | grep'

# node
alias ndb='node --inspect --watch'

# ===== npm shortcuts =====
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nt='npm test'
alias nstart='npm start'
alias nbuild='npm run build'
alias ndev='npm run dev'

# ===== pnpm shortcuts =====
alias pn='pnpm'
alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm run'
alias pt='pnpm test'
alias pstart='pnpm start'
alias pdev='pnpm dev'
alias pbuild='pnpm build'

# ===== Yarn shortcuts =====
alias y='yarn'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'
alias yt='yarn test'

# ===== Docker compose shortcuts =====
alias dcu='docker-compose up -d'
alias dcub='docker-compose up -d --build'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'

# ===== Docker container management =====
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dbash='docker exec -it'
alias drun='docker run -it --rm'

# ===== Docker cleanup =====
alias dprune='docker system prune -af'
alias drmi='docker rmi $(docker images -q -f dangling=true)'
alias drmc='docker rm $(docker ps -aq -f status=exited)'

# ===== Network =====
alias ping='ping -c 5'
alias localip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
alias myip='curl https://ipinfo.io/ip; echo'

# ===== Text processing =====
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ===== Quick file editing =====
alias v='vim'
alias c='code'  # VS Code
alias subl='open -b com.sublimetext.4'

# ===== File permissions =====
alias mx='chmod a+x'     # Make file executable for all users (owner, group, others)
alias 000='chmod -R 000' # Remove all permissions (no read, write, execute for anyone)
alias 644='chmod -R 644' # Read/write for owner, read-only for group and others
alias 666='chmod -R 666' # Read/write for everyone (no execute permissions)
alias 755='chmod -R 755' # Full permissions for owner, read/execute for group and others
alias 777='chmod -R 777' # Full permissions for everyone (read, write, execute)

# ===== Reload shell config =====
alias resource='source ~/.zshrc && echo "Reloaded!"'

# ===== Environment shortcuts =====
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime='date +"%d-%m-%Y %T"'

# ===== Development servers =====
alias liveserver='npx live-server'
alias pyserve='python3 -m http.server 1487'
