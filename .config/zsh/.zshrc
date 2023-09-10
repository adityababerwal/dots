# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[magenta]%}╭─%{$fg[green]%}%n %{$fg[red]%}in %{$fg[cyan]%}%~
# %{$fg[magenta]%}╰────%b "
PS1="%{$fg[blue]%}%~ %{$fg[red]%}%{$fg[green]%}%{$fg[blue]%} "
RPS1="%T %D{%a %d %b}"
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases, functions and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# vi mode
bindkey -v
export KEYTIMEOUT=1
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export PAGER=vimpager
# export MANPAGER=vimpager

bindkey -s '^o' 'lfcd\n'
bindkey -s '^w' 'open_with_mpv\n'
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^g' 'cd "$(fd -H | fzf)"\n'
bindkey -s '^n' 'nvim "$(fzf)"\n'
bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# eval $(starship init zsh)

# Load syntax highlighting; should be last.
# source /home/aditya/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
