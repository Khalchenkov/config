<h1 align="center">Neovim setup</h1>

## Neovim
Neovim last version

[Neovim site](https://neovim.io/)

## Nerd Fonts

Recomended font version < 3version

[Nerd fonts site](https://www.nerdfonts.com/)

Move archive to `~/.local/share/fonts/`, unzip archive, remove zip file and run

```bash
fc-cache -fv
```

## Nodejs

[Nodejs site](https://nodejs.org/en)

Installing node.js using [nvm](https://github.com/nvm-sh/nvm)

## Coc-settings

Run `:CocConfig`

```json
{
  "inlayHint.enable": false,
  "signature.enable": false,
}
```

Or if you want use kind

```json
{
  "inlayHint.enable": false,
  "signature.enable": false,
  "suggest.formatItems": ["kind", "abbr", "menu", "shortcut"],
  "suggest.completionItemKindLabels": {
    "method": " 󰆧 ",
    "function": " 󰆧 ",
    "variable": "[]",
    "field": " 󰜢 ",
    "typeParameter": "<>",
    "constant": "  ",
    "class": " 󰠱 ",
    "interface": "  ",
    "struct": "  ",
    "event": "  ",
    "operator": "  ",
    "module": "  ",
    "property": "  ",
    "enum": " 練 ",
    "reference": " 󰈇 ",
    "keyword": "  ",
    "file": "  ",
    "folder": "  ",
    "color": "  ",
    "unit": " 塞 ",
    "snippet": "  ",
    "text": "  ",
    "constructor": "  ",
    "value": " 󰚩 ",
    "enumMember": "  ",
    "default": "  "
  }
}
```
