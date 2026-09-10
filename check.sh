#!/usr/bin/env bash
set -u

fail=0
ok() { printf '  [ok] %s\n' "$1"; }
bad() { printf '  [!!] %s\n' "$1"; fail=1; }

echo "chui check"

[[ -L $HOME/.zshrc && $(readlink "$HOME/.zshrc") == *chui/config/zshrc ]] && ok "zshrc symlink" || bad "zshrc not linked to chui"
[[ -L $HOME/.p10k.zsh ]] && ok "p10k symlink" || bad "p10k not linked"
[[ -d $HOME/.oh-my-zsh ]] && ok "oh-my-zsh" || bad "oh-my-zsh missing"
[[ -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]] && ok "powerlevel10k" || bad "powerlevel10k missing"
[[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]] && ok "autosuggestions" || bad "autosuggestions missing"
[[ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] && ok "syntax-highlighting" || bad "syntax-highlighting missing"
[[ -d $HOME/.oh-my-zsh/custom/plugins/fzf-tab ]] && ok "fzf-tab" || bad "fzf-tab missing"
[[ -e $HOME/.oh-my-zsh/custom/forge.zsh ]] && ok "forge.zsh" || bad "forge.zsh missing"
[[ -L $HOME/.config/zellij/config.kdl ]] && ok "zellij config" || bad "zellij config not linked"

for cmd in zsh brew git eza bat fd fzf zoxide delta btop lazygit fastfetch zellij; do
  command -v "$cmd" >/dev/null && ok "$cmd" || bad "$cmd missing"
done

if [[ -L $HOME/.zshrc ]]; then
  grep -q 'ZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME/.zshrc" && ok "theme p10k" || bad "theme not p10k"
fi

echo
if [[ $fail -eq 0 ]]; then
  echo "all checks passed"
  exit 0
fi
echo "some checks failed"
exit 1
