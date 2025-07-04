# Scorpio's Gruv-ified Dotfiles

So Microsoft is killing Windows 10 and jacking the Office 365 to $100 so why don't we
finally make the switch. To make the switch stick I wanted to Rice and make my dektop
"mine" again. Thankfully I found the Gruvbox Theme which speaks to me on another level.
This will always be a WIP because change is beautiful but feel free to stumble along
with me.

# Contents

1. [Previews](#Previews)
2. [General Guide](#General-Guide)
3. [Links](#Links)
    1. [Window Manager](#Window-Manager)
        1. [Hyprland](#Hyprland)
        2. [Hyprland Plugins](#Hyprland-Plugins)
    2. [Apps](#Apps)
        1. [System Apps](#System-Apps)
        2. [Terminal Apps](#Terminal-Apps)
            1. [NeoVim Plugins](#NeoVim-Plugins)
    3. [GUI Apps](#Gui-Apps)
4. [Keybind Cheat Sheet](#Keybind-Cheat-Sheet)
5. [Misc Details](#Misc-Details)
6. [Closing Notes](#Closing-Notes)
7. [References & Sources](#References-&-Sources)

# Previews

> Desktop Previews
![Desktop Preview 1](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/desk-preview-1.png)
![Desktop Preview 2](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/desk-preview-2.png)
![Desktop Preview 3](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/desk-preview-3.png)
![Desktop Preview 4](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/desk-preview-4.png)
![Desktop Preview 5](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/desk-preview-5.png)

> Fastfetch Preview
![Fastfetch Preview](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/fastfetch-preview-1.png)

> Waybar Left Modules 
>
>![Waybar Left Modules](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/wyabar-left-modules.png)
>
> L -> R [Wallpaper Menu | Workspaces | Cava Visualizer]

> Waybar Center Module
>
>![Waybar Left Modules](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/waybar-center-modules.png)
>
> L -> R [Active Window]

> Waybar Right Modules
>
>![Waybar Right Modules](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/waybar-right-modules.png)
>
> L -> R [Sound | Clock & Calander | System Tray | Wifi Menu | Power Menu]

> Tiling Previews
![Working Preview 1](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/workspace-preview-1.png)
![Working Preview 2](https://github.com/ScorpioGameKing/Scorpio-Gruv-dotfiles/blob/master/assets/images/workspace-preview-2.png)

# General Guide 

This is NOT a perfect install guide. Your mileage may vary. With that being said I'll try to provide a rough, general 
setup process from headless to rice that should get us most of the way.

I start from a headless Arch install, currently I've been using EndavourOS (We don't need the EndeavourOS Apps) to 
streamline the process. From there we'll reboot into a TTY. I'll be leaving setting up `SDDM`/`UWSM` to the user and 
continuing from the TTY.

We're first going to install some helpful applications. I'll first be grabbing `yeet` which I use as a handy Pacman + 
Aur wrapper. `yeet` is not required but I've found it's incredibly helpful for finding packages quickly. For further 
convienience we're also going to install `yazi`. Take note that when we first run `yeet` it will auto generate a config 
file. We will remove auto generated files like this for a minute later when we pull the repository and get ready to run 
`stow`. We're going to first finish setting up our terminal apps. We can grab `fastfetch` really quick and move onto 
`NeoVim`. After installing `NeoVim` we're also going to want to install `Packer` so we can pull in our plugins later on. 
I will be looking at porting the plugin install to `lazy.vim` later on. Once we have these installed we can start 
looking what's needed for our `hyprland` install.

Before we grab hyprland we're going to clone down the repo to `~` and rename it to `dotfiles`, this is just how I manage
mine for quick access. We're going to download stow, if you've followed to this point we'll only need to delete our
`yeet` and `nvim` folders from `~/.config/`. Once the folders are removed, move into `dotfiles` and run `stow .` to 
pull all of our configs. Before moving further let's fix our `NeoVim` as it'll scream plenty of errors at us when running
now. To solve this all we need to do is run `nvim`, work through the errors, and then run `:PackerSync`. With Neovim 
working let's also check out our `fastfetch` to make sure the ascii is working, we'll worry about fonts later when we 
install `wezterm`.

Now that we have our configs in place let's finally get to installing `hyprland`. If you try opening into hyprland we 
won't have much. To exit out at this point you'll need to use `triMod + M`, `triMod` being ` CTRL + SHIFT + ALT + SUPER`.
First thing you'll most likely notice are the errors on launching `hyprland`. We're going to fix this but the plugin 
manager, `hyprpm` needs to be run while in `hyprland` so let's download `wezterm` and head back in.

With `wezterm` installed we can now open a terminal window using `mainMod + RETURN`, `mainMod` being `SUPER`. We should
have 2 windows open, one telling us to install our font and the second being a terminal. We'll oblige and quickly 
`yeet` for our font `ttf-agave-nerd`. We can kill these 2 windows with `mainMod + X` and open a new terminal window, now
without the error window. Make sure you've installed the `hyprpm` dependencies if they're missing and run `hyprpm update`.
Once that's finished we can grab our plugin, `split-monitor-workspaces` using `hyprpm add` and then enabling with
`hyprpm enable`. Finish it off with a `hyprpm reload` and that should be solved.

Now that we're in `hyprland` with a working terminal, file browser and package manager we can procede a few routes. I'll 
be starting by working on installing more "System Apps". The first we're going to bring in will be `waybar`, this will
be useful for knowing where we are in `hyprland`. An important thing to pay attention to, we're going to be building 
our `waybar` with `cava` support to enable the visualizer module. This means we'll need to ensure we have the `waybar` 
and `cava` module dependecies installed. If you stiil have issues with `gdbus-codegen` then install `glib2-devel`. Once
built we test it out. Once we know it's properly built and the modules appear we can then install it. If the bar isn't
appearing don't worry. It means you aren't using a HDMI and DP setup so we'll fix the config. Find the `waybar` folder
in your `.config` directory. We nned to open `config.jsonc` and delete or modify the lines with `output = []`.

You may notice that our `waybar` still looks a bit odd, that's fine, we're going to set up a few more apps that `waybar`
uses and then handle that. The first thing we'll run and grab will be `rofi`. With `rofi` installed we'll now have access
to a dmenu interface with `mainMod + SPACE`. We're also going to quickly grab `swww` and `waypaper` so we can manage our
wallpapers. Now if you've taken a peek at our `exec-once` commands already, you'll know we'll also want to grab `swaync`
to make sure hyprland starts correctly and we can recive notifications.

With these set up, let's finish tweaking `waybar` so everything appears correctly. In our waybar we have several launcher
buttons. The `Arch` icon to the far left will open a floating `waypaper` window in the center of your screen, this
be functioning properly already. To the far right we also have power options and wifi menu. These may need their anchors
in the respective `rofi` `rasi` file, i.e. the power menu is `power-menu.rasi`. The last thing we need to grab for waybar
is the font, `oft-font-awesome`. With these touched up let's look at getting the rest of our system apps set up.

Look back at our `hypr` directory, we have 2 other programs to install here. `hypridle` and `hyprlock`, they should both
install without issue. And to wrap up our `exec-once` section we also want to install `hyprpolkitagent` so GUI applications
have a way to request authentication. We're going to finish up our `hyprland` config with `mpd`, `udiskie` and `rmpc`.
With those set up let's move on to some more general themeing and QOL features.

Let's fix up our boring cursor and grab `hyprcursor` and `rose-pine-hyprcursor`, with that we have a much nicer pointer.
Next we're going to grab a few more apps, `fzf`, `eza`, `zoxide`, `starship` and then set up our `.bashrc`. Below are the 
lines we want to add.

```sh
alias ls='eza -TF -L 1 -s type --icons=auto -lUmh --git-repos --no-permissions'
alias fneo='clear && fastfetch'

fneo

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
```
From here you're able to go and build as you wish, I recommend browsing the site I inculded for some Gruvbox themed 
backgrounds but that's as far as my current dotfiles go. We should have a fairly clean and ready to use tiling desktop
with some helpful applications ready to go. In the links below I'll include any other various applications I recomend
but otherwise enjoy!

# Links

## Window Manager

### Hyprland

Tiling Window Manager
> https://wiki.hyprland.org/Getting-Started/Master-Tutorial/

### Hyprland Plugins

Bind Workspaces to Monitors
> https://github.com/Duckonaut/split-monitor-workspaces

## Apps

### System Apps

Terminal: Wezterm
> https://wezterm.org/

Pacman + AUR Wrapper: yeet
> https://github.com/gamemaker1/yeet

Wallpaper: swww + waypaper
> https://github.com/LGFae/swww
> https://github.com/anufrievroman/waypaper

Wallpapers From:
> https://github.com/AngelJumbo/gruvbox-wallpapers

Colorpicker: hyprpicker
> https://github.com/hyprwm/hyprpicker

Idler: hyperidle
> https://github.com/hyprwm/hypridle

Lockscreen: hyprlock
> https://github.com/hyprwm/hyprlock/

Cursor: hyprcursor + Rose Pine
> https://github.com/hyprwm/hyprcursor
> https://github.com/ndom91/rose-pine-hyprcursor

Status Bar: waybar 
> https://github.com/Alexays/Waybar

App Launcher: Rofi
> https://github.com/davatorium/rofi

### Terminal Apps

File Manager: yazi
> https://yazi-rs.github.io/

Fetch: fastfetch
> https://github.com/fastfetch-cli/fastfetch

Text Editor: NeoVim 
> https://neovim.io/

#### NeoVim Plugins

Packer: Plugin Manager
> https://github.com/wbthomason/packer.nvim

Telescope: File Viewer
> https://github.com/nvim-telescope/telescope.nvim

Treesiter: Code Highlighting
> https://github.com/nvim-treesitter/nvim-treesitter

Harpoon 2: Primeagen Meme
> https://github.com/ThePrimeagen/harpoon/tree/harpoon2

Undotree: Git-Like Undo Tree
> https://github.com/mbbill/undotree

Vim Fugitive: Git in Vim
> https://github.com/tpope/vim-fugitive

Vim Be Good: Because Practice Makes Perfect
> https://github.com/ThePrimeagen/vim-be-good

Gurvbox Theme: Make it Gruvy
> https://github.com/ellisonleao/gruvbox.nvim

### GUI Apps

Steam: Gotta Game
> https://archlinux.org/packages/multilib/x86_64/steam/ 

# Keybind Cheat Sheet

WIP

> For now please refer to the `hyprland.config` file for keybinds

# Misc Details

07-02-2025 [Active Issue]
> Try to avoid the `-git` branches. There was a recent issue with Hyprutils updating before the `-git` branch and if we
> can avoid them we probably should. And don't mix `-git` with the base. Rolling is good, bleeding edge will cut you.

# References & Sources

A quick shout out to the following projects, people and groups for making my transiton to linux fun and mostly painless.

ML4W for showing me that ricing was cool AND useful
> https://github.com/mylinuxforwork/dotfiles

Mechabar menus are simple and effiecent
> https://github.com/sejjy/mechabar

Bread On Penguin for fun and useful Apps
> https://www.youtube.com/@BreadOnPenguins

The Linux Cast for reminding me I always have more to learn 
> https://www.youtube.com/@TheLinuxCast

