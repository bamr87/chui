mkcd() {
  mkdir -p "$1" && cd "$1"
}

proj() {
  local projects_dir="$HOME/github"
  if [[ -z "$1" ]]; then
    echo "Available projects:"
    ls -1 "$projects_dir" 2>/dev/null || echo "No projects found"
  elif [[ -d "$projects_dir/$1" ]]; then
    cd "$projects_dir/$1" && echo "Jumped to $1"
  else
    echo "Project '$1' not found"
    return 1
  fi
}

note() {
  local notes_dir="$HOME/.dev-notes"
  mkdir -p "$notes_dir"
  local today="$(date +%Y-%m-%d)"
  echo "[$(date +%H:%M)] $*" >> "$notes_dir/$today.md"
  echo "Note saved to $notes_dir/$today.md"
}

chui() {
  local cmd=${1:-dash}
  case $cmd in
    dash|"")
      local w=56
      local line
      line=$(printf '─%.0s' {1..56})
      print -P "%F{cyan}╭${line}╮%f"
      print -P "%F{cyan}│%f  %BCHUI%b  ${HOST:r}  $(date '+%Y-%m-%d %H:%M')%F{cyan}│%f"
      print -P "%F{cyan}├${line}┤%f"
      print -P "%F{cyan}│%f  shell   %F{green}zsh ${ZSH_VERSION}%f + oh-my-zsh + p10k"
      print -P "%F{cyan}│%f  tools   eza bat fd fzf zoxide delta"
      print -P "%F{cyan}│%f  tui     zellij  btop  lazygit  fastfetch"
      print -P "%F{cyan}│%f  git     $(command git rev-parse --abbrev-ref HEAD 2>/dev/null || echo '—')  $(command git status -sb 2>/dev/null | head -1)"
      if command ssh -o ConnectTimeout=2 -o BatchMode=yes forge true 2>/dev/null; then
        print -P "%F{cyan}│%f  forge   %F{green}up%f"
      else
        print -P "%F{cyan}│%f  forge   %F{red}down%f  (forge wake)"
      fi
      print -P "%F{cyan}│%f  root    ${CHUI_ROOT:t}  ${CHUI_ROOT}"
      print -P "%F{cyan}╰${line}╯%f"
      print "  chui help   chui check   zj   lg   btop   forge"
      ;;
    help|-h|--help)
      cat <<'EOF'
chui              dashboard
chui check        verify install
chui backup       snapshot configs
chui restore      restore latest backup
chui help         this list

zj                zellij workspace
lg                lazygit
btop              process TUI
ff                fastfetch
forge             remote dev box
proj <name>       jump to ~/github/<name>
note <text>       append to ~/.dev-notes
EOF
      ;;
    check)   "${CHUI_ROOT}/check.sh" ;;
    backup)  "${CHUI_ROOT}/backup.sh" ;;
    restore) "${CHUI_ROOT}/uninstall.sh" ;;
    *) echo "unknown: $cmd  (chui help)"; return 1 ;;
  esac
}
