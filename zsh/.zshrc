export PROMPT='%n %~ %# '

# --- PLUGINS DE ZSH ---
# Must be sourced before autosuggestions. 
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- MODERN TOOLS SETUP ---

# Zoxide: A smarter cd command (z)
# https://github.com/ajeetds/zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# Eza: A modern replacement for 'ls'
# https://github.com/eza-community/eza
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"
alias tree="eza --tree --icons"

# Fzf: Fuzzy finder for files and history
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Load fzf if it exists
source <(fzf --zsh) # Set up fzf key bindings and fuzzy completion

# --- DOTFILES AUTOMATION ---
# Update Brewfile, add all changes, and sync with GitHub
alias dotpush="cd ~/dotfiles && brew bundle dump --force && git add . && git commit -m 'Update dotfiles: $(date +\"%Y-%m-%d %H:%M\")' && git push && cd -"

# --- PROMPT CONFIGURATION ---
# NOTE: This must always be at the very end of the file to work correctly.
eval "$(starship init zsh)"
