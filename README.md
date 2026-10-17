# chui

> Rebuildable macOS terminal setup: Oh My Zsh, Powerlevel10k, Zellij and modern CLI tools, with backup and restore.

[![License](https://img.shields.io/github/license/bamr87/chui)](LICENSE)

## Overview

Rebuildable terminal CHUI for macOS: Oh My Zsh + Powerlevel10k + modern CLI + Zellij.

## Features

- Idempotent `install.sh` that installs the Brewfile (eza, bat, fd, fzf, zoxide, git-delta, btop, lazygit, zellij, gum and the MesloLGS Nerd Font) and links the configs
- Oh My Zsh with Powerlevel10k, plus aliases, functions and key bindings for Apple Terminal and VS Code
- A `chui` menu to update and configure icons, splash, font and theme
- `chui home` maps `$HOME` and sweeps strays into `~/Documents/Archive`
- `make backup` / `chui restore` snapshot configs to `~/.chui-backups/` and roll them back

## From scratch

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git gh && gh auth login
gh repo clone bamr87/chui ~/github/chui
cd ~/github/chui && make backup && make install
exec zsh
```

Font must be **MesloLGS Nerd Font** (not SF Mono) or `ls` icons show as `?`. Install sets it; `chui doctor` verifies. **Quit Terminal.app** after install so keys apply.

## Everyday

| Command | What |
| --- | --- |
| `chui` | interactive menu (update / configure) |
| `chui home` | map `~` + next level (two columns when maximized) |
| `chui home open` | zellij layout: visible \| hidden + strays |
| `chui home sweep` | move `$HOME` strays into `~/Documents/Archive` |
| `hm` / `zh` | aliases for `chui home` / `chui home open` |
| `chui check` | verify install |
| `chui backup` | snapshot configs |
| `chui restore` | roll back last snapshot |
| `zj` | zellij |
| `lg` | lazygit |
| `btop` | processes |
| `z <dir>` | jump (zoxide) |
| `forge` | remote dev box |
| `chui keys` | keyboard shortcuts |
| `chui update` | git pull + reinstall |
| `chui configure` | icons, splash, font, theme |

Prefs live in `~/.config/chui/local.zsh` (not git). TUI: **↑↓** choose · **enter** · **esc** back.

Maximize the window, then `hm`. Finder hides dotfiles; a plain `ls` hides the next level and file size. The map splits **visible** vs **hidden**, expands one level down, flags **LARGE** files, and tags **stray** items that should not live at `$HOME` root. `chui home sweep` moves selected strays to `~/Documents/Archive` (nothing is deleted). Set `CHUI_HOME_MAP=1` to show the map when a new shell starts in `~`.

**Keys:** ⌘←/→ line · ⌥←/→ word · ⌘⌫ kill to start · ⌃R fuzzy history. Full list: [docs/KEYS.md](docs/KEYS.md).

## Project structure
```
Brewfile              packages
install.sh            idempotent bootstrap
backup.sh             ~/.chui-backups/<stamp>
uninstall.sh          restore latest backup
check.sh              smoke test
config/zshrc          linked to ~/.zshrc
config/zshenv         linked to ~/.zshenv (disables session restore)
config/p10k.zsh       linked to ~/.p10k.zsh
config/aliases.zsh
config/functions.zsh
config/keybindings.zsh
config/terminal/      Apple Terminal + VS Code key maps
config/zellij/        config + home layout
config/home.sh        $HOME map / sweep
custom/forge.zsh      linked into oh-my-zsh custom
```

Backups live in `~/.chui-backups/` (not in git). Secrets are never committed.

## Rollback

```bash
cd ~/github/chui && make uninstall
```

## Development

```bash
make check     # smoke test (check.sh)
make update    # git pull + reinstall
```

## Contributing

Contributions are welcome via pull request. Use [Conventional Commits](https://www.conventionalcommits.org/) and keep the CI checks green. The fleet-wide workflow is described in the hub's [CONTRIBUTING.md](https://github.com/bamr87/bamr87/blob/main/CONTRIBUTING.md).

## Changelog

There is no CHANGELOG.md yet; changes are tracked in the [commit history](https://github.com/bamr87/chui/commits/main).

## License

Released under the [MIT License](LICENSE).

---

<!-- bamr87-portfolio-footer -->
<sub>Part of the [bamr87 portfolio](https://github.com/bamr87) — browse every project on [Amr's GitHub profile](https://github.com/bamr87).</sub>
