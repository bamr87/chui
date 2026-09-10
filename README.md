# chui

Rebuildable terminal CHUI for macOS: Oh My Zsh + Powerlevel10k + modern CLI + Zellij.

## From scratch

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git gh && gh auth login
gh repo clone bamr87/chui ~/github/chui
cd ~/github/chui && make backup && make install
exec zsh
```

Set the terminal font to **MesloLGS NF** if glyphs look wrong.

## Everyday

| Command | What |
| --- | --- |
| `chui` | dashboard |
| `chui check` | verify install |
| `chui backup` | snapshot configs |
| `chui restore` | roll back last snapshot |
| `zj` | zellij |
| `lg` | lazygit |
| `btop` | processes |
| `z <dir>` | jump (zoxide) |
| `forge` | remote dev box |

## Layout

```
Brewfile              packages
install.sh            idempotent bootstrap
backup.sh             ~/.chui-backups/<stamp>
uninstall.sh          restore latest backup
check.sh              smoke test
config/zshrc          linked to ~/.zshrc
config/p10k.zsh       linked to ~/.p10k.zsh
config/aliases.zsh
config/functions.zsh
config/zellij/
custom/forge.zsh      linked into oh-my-zsh custom
```

Backups live in `~/.chui-backups/` (not in git). Secrets are never committed.

## Rollback

```bash
cd ~/github/chui && make uninstall
```
