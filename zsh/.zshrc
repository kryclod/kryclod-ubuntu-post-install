# Created by newuser for 5.8

# ---/// starship support
eval "$(starship init zsh)"

# ---/// initialice neofetch
neofetch --source ~/.config/neofetch/ascii/kartanus-ascii-sword.txt

# ---/// custom alias
# ls -> lsd
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
# cat -> bat
alias cat='batcat' 
# python -> python3
alias python='python3'
# top -> bashtop
alias top='bashtop'
# navigation
alias cddo='cd ~/Downloads/' 

# ---/// bindkey
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
