<h1 align="center">Terminal setup</h1>

Gnome Terminal Size: 120x34

## Zsh

[Oh-my-zsh site](https://ohmyz.sh/)

### Plugins

- autosuggesions plugin

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting plugin

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

- zsh-autocomplete plugin

```bash
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
```

## Starship for Root shell
[Starship](https://starship.rs/)

Put `eval "$(starship init bash)"` into `/root/.bashrc`

## Command

```bash
apt install fzf neofetch tmux nala mc curl git zsh
```

Cargo command

```bash
cargo install bat exa lsd git-delta du-dust fd-find ripgrep bottom gping zoxide
```

### My favorite theme for Midnight Commander is Dracula
[Dracula theme for Midnight Commander](https://draculatheme.com/midnight-commander)

## Programming Language

### Python
[Python site](https://www.python.org/)

Installing python using [uv](https://docs.astral.sh/uv/)

Pyright:
- [Pyright](https://microsoft.github.io/pyright/#/)

Formatters and diagnostics:
- [Ruff](https://github.com/astral-sh/ruff)
- [Mypy](https://github.com/python/mypy)
- [Black](https://github.com/psf/black)

Optional for django:
- [DjHTML](https://github.com/rtts/djhtml)

### Golang
[Golang site](https://go.dev/)

Golang path

```bash
mkdir -p ~/.go/bin && mkdir ~/.go/lang
```

Put the contents of the `go/` folder from the downloaded archive on the site into the folder `~/.go/lang/`

```bash
tar -xzvf 'archive-path' -C ~/.go/lang/ --strip-components=1 go/
```

Gopls:
- [Gopls](https://pkg.go.dev/golang.org/x/tools/gopls)

Optional formatters:
- [Golines](https://pkg.go.dev/github.com/wrype/golines)
- [Goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports)

### Rust
[Rust site](https://www.rust-lang.org/)

Rust-analyzer:
- [Rust-analyzer](https://rust-analyzer.github.io/)

### Web
[Node.js site](https://nodejs.org/en) and [Bun site](https://bun.sh/)

Installing node.js using [nvm](https://github.com/nvm-sh/nvm)

Web tools:
- [Prettier](https://prettier.io/)
- [Live-server](https://www.npmjs.com/package/live-server)
