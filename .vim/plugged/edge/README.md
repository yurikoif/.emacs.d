|         |                                                     𝐃𝐚𝐫𝐤                                                      |                                                     𝐋𝐢𝐠𝐡𝐭                                                      |
| :-----: | :-----------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------: |
| 𝐝𝐞𝐟𝐚𝐮𝐥𝐭 | ![dark](https://user-images.githubusercontent.com/37491630/70863551-59e90480-1f41-11ea-97f6-36b73eef8773.png) | ![light](https://user-images.githubusercontent.com/37491630/70863554-5c4b5e80-1f41-11ea-96d8-a48762addfe5.png) |
|  𝐧𝐞𝐨𝐧   | ![dark](https://user-images.githubusercontent.com/37491630/70910638-055c8c80-2008-11ea-8e13-24f5236fb8b5.png) | ![light](https://user-images.githubusercontent.com/37491630/70910639-05f52300-2008-11ea-96d3-de2ac35bd11d.png) |

# Installation

## Via Plugin Manager

Take [vim-plug](https://github.com/junegunn/vim-plug) for example:

```vim
Plug 'sainnhe/edge'
```

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).

## Manually

1. Clone this repository.
2. Copy `/path/to/edge/colors/*` to `~/.vim/colors/` .
3. To install [airline](https://github.com/vim-airline/vim-airline) theme, copy `/path/to/edge/autoload/airline/themes/*` to `~/.vim/autoload/airline/themes/` .
4. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/edge/autoload/lightline/colorscheme/*` to `~/.vim/autoload/lightline/colorscheme/` .

# Usage

## Vim

Put this in your vimrc:

```vim
" important!!
set termguicolors

" for dark version
set background=dark

" for light version
set background=light

" the configuration options should be placed before `colorscheme edge`
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1

colorscheme edge
```

See [Configuration](https://github.com/sainnhe/edge#configuration) for more configuration options.

If you want to apply this color scheme temporarily, run this command in vim(**this may cause broken colors**):

```vim
:colorscheme edge
```

### Airline

To enable [airline](https://github.com/vim-airline/vim-airline) color scheme, put this in your vimrc:

```vim
let g:airline_theme = 'edge'
```

To apply it without reloading:

```vim
:AirlineTheme edge
```

### Lightline

To enable [lightline](https://github.com/itchyny/lightline.vim) color scheme, put this in your vimrc:

```vim
let g:lightline = {}
let g:lightline.colorscheme = 'edge'

" or this line
let g:lightline = {'colorscheme' : 'edge'}
```

To apply it without reloading:

```vim
:let g:lightline.colorscheme = 'edge'
:call lightline#init()
:call lightline#colorscheme()
```

### Configuration

**Note:** The configuration options should be placed before `colorscheme edge` .

- `g:edge_style`: Customize the style of this color scheme.
  - Available values: `'default'`, `'neon'`
  - Default value: `'default'`
- `g:edge_transparent_background`: Set to `1` to enable transparent background.
  - Available values: `0`, `1`
  - Default value: `0`
- `g:edge_popup_menu_selection_background`: Control the background color of `PmenuSel` and `WildMenu` .
  - Available values: `'blue'`, `'green'`, `'purple'`
  - Default value: `'blue'`
- `g:edge_disable_italic_comment`: Set to `1` to disable italic in `Comment` .
  - Available values: `0`, `1`
  - Default value: `0`
- `g:edge_current_word`: Some plugins can highlight the word under current cursor(for example [neoclide/coc-highlight](https://github.com/neoclide/coc-highlight)), you can use this option to control their behavior.
  - Available values: `'bold'`, `'underline'`, `'italic'`, `'grey background'`
  - Default value: `'grey background'` when not in transparent mode, `'bold'` when in transparent mode.
- `g:edge_lightline_disable_bold`: Set to `1` to disable bold in lightline theme.
  - Available values: `0`, `1`
  - Default value: `0`

## Tmux Status Line

Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

## Zsh

- [Syntax Highlighting](https://github.com/sainnhe/edge/tree/master/zsh#syntax-highlighting)
- [Prompt](https://github.com/sainnhe/edge/tree/master/zsh#prompt)

## Terminal Emulators

- [Alacritty](./alacritty/README.md)
- [Kitty](./kitty/README.md)
- [Termite](./termite/README.md)
- [Tilix](./tilix/README.md)

## More

- [Xresources](./xresources/README.md)
- [fzf](./fzf/README.md)

## FAQ

**Q: It doesn't work as expected.**

**A:**

1. This color scheme is mainly designed for true colors, `set termguicolors` is required. Check output of `vim --version`, maybe your vim doesn't support `termguicolors`.

2. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern).

3. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true color properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)

4. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause colors to break. If any color is broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: What's your status line configuration?**

**A:** Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

**Q: What's the font used here?**

**A:** [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode).

# Inspiration

- [Atom One](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)

- [Material](https://github.com/equinusocio/material-theme)

# Thanks to

- [manfredmjka](https://github.com/manfredmjka): termite and fzf support

# License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
