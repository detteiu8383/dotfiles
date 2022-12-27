### zinit ###
typeset -gAH ZINIT
ZINIT[HOME_DIR]="$XDG_DATA_HOME/zinit"
ZINIT[ZCOMPDUMP_PATH]="$XDG_STATE_HOME/zcompdump"
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"

### paths ###
typeset -U path
typeset -U fpath

path=(
    "$HOME/.local/bin"(N-/)
    "$XDG_CONFIG_HOME/scripts/bin"(N-/)
    "$path[@]"
)

fpath=(
    "$XDG_DATA_HOME/zsh/completions"(N-/)
    "$fpath[@]"
)

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt GLOBDOTS
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_SHARE_HISTORY
setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT
setopt NO_FLOW_CONTROL

### Homebrew ###
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### Starship ###
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
eval "$(starship init zsh)"

### shortcut ###

fcd() {
    local dir
    dir=$(find "${1:-.}" -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir" || exit
}

fvim() {
    local file
    file=$(
        rg --files --hidden --follow --glob "!**/.git/*" |
        fzf --preview 'bat  --color=always --style=header,grid {}' --preview-window=right:60%
    )
    vi "$file"
}
alias fv="fvim"

fgh() {
  local repo
  repo="$(ghq list | fzf +m)"
  [[ -n "${repo}" ]] && cd "$(ghq root)/${repo}" || exit
}

fadd() {
  local selected
  selected=("$(
    git status --short |
    fzf -m \
    --preview "if [ ! -e {2} ];then
      echo {2} has been removed.
    elif [[ -d {2} ]];then
      echo {2} is directory.
    elif [[ {1} =~ '^M.*$' ]];then
      bat --color=always --style=header,grid,numbers,changes --diff {2}
    else
      bat --color=always --style=header,grid,numbers,changes {2}
    fi" \
    --preview-window=right:60% | 
    awk '{print $2}'
  )")

  if [[ -n "${selected}" ]]; then
    selected=$(tr "\n" " " <<< "${selected}")
    xargs git add "${@:1}" <<< "${selected}" && echo "Completed: git add ${selected}"
  fi
}

widget::history() {
    local selected 
    selected="$(history -inr 1 | fzf --exit-0 --query "$LBUFFER" | cut -d' ' -f4- | sed 's/\\n/\n/g')"
    if [ -n "$selected" ]; then
        BUFFER="$selected"
        CURSOR=$#BUFFER
    fi
    zle -R -c # refresh screen
}

zle -N widget::history
bindkey "^R" widget::history

### local settings ###
[ -f "$ZDOTDIR/.zshrc.local" ] && source "$ZDOTDIR/.zshrc.local"

### plugins ###
zinit wait lucid null for \
    atinit'source "$ZDOTDIR/.zshrc.lazy"' \
    @'zdharma-continuum/null'