#!/usr/bin/env fish

# Assumptions:
#   - We have a normal user account setup already with SUDO privledges
#   - we have fish installed
# TODO:
#   - install needed packages
#   - generate SSH key for github
#   - clone dotfiles and link them to .config

function install_packages
    echo (set_color green)"Beginning package installs. This may take a while..."
    # install packages from offical repos
    echo "Starting with offical repo packages..."(set_color normal)
    sudo pacman -S --needed hyprland neovim waybar mako fuzzel ripgrep bat bottom eza alacritty easyeffects transmission-gtk signal-desktop kicad kicad-library kicad-library-3d pavucontrol bluez bluezutils nvidia-dkms wallutils wl-clipboard tmux swayidle tailscale python-pipx nvtop ncdu minicom openconnect grim slurp docker xdg-desktop-portal-hyprland flatpak firefox exfatprogs dolphin dhcpcd btrfs-progs bitwarden curl texlive zathura zathura-pdf-mupdf newsboat dmenu nerd-fonts
    echo (set_color green)"Done!"(set_color normal)


    echo (set_color green)"Moving on to non-offical packages..."(set_color normal)
    # install packages from unofficial repos
    cd ~/the-source
    # install bluetooth driver 
    git clone https://github.com/lwfinger/rtw89.git
    cd rtw89
    make
    sudo make install
    cd ~/the-source/

    # install notion
    git clone https://aur.archlinux.org/notion-app-electron.git
    cd notion-app-electron
    makepkg -si
    cd ~

    # install rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fish_add_path ~/.cargo/bin/

    # install rust packages via cargo
    set -x OPENSSL_DIR=/etc/ssl
    set -x OPENSSL_INCLUDE_DIR=/usr/include/openssl
    set -x OPENSSL_LIB_DIR=/usr/lib
    cargo install macchina cargo-update

    # install vimplug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # install fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

    # install tide prompt
    fisher install IlanCosman/tide@v5

    # install sunwait for sunpaper.sh
    cd ~/the-source/
    git clone https://github.com/risacher/sunwait.git
    cd sunwait
    make sunwait
    cp sunwait ~/bin

    # install swww for sunpaper.sh
    cd ~/the-source/
    git clone https://github.com/Horus645/swww.git
    cd swww
    cargo build --release
    cp target/release/{swww,swww-daemon} ~/.cargo/bin

    # install SF Mono fonts
    cd ~/the-source/
    git clone https://github.com/supercomputra/SF-Mono-Font.git
    cd SF-Mono-Font
    sudo cp -v *.otf /usr/share/fonts/OTF/
    fc-cache

    echo (set_color green)"Done!"(set_color normal)
end

function read_confirm
    while true
        read -l -P 'Do you want to continue? [y/N] ' confirm

        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end

function get_dotfiles
    cd ~
    echo (set_color green) "generating SSH key and copying to clipboard." (set_color normal)
    ssh-keygen -t ed25519 -C "Tristen Nollman <tristen@tristen.wtf>"
    bat ~/.ssh/id_ed25519.pub | wl-copy
    echo "Done. Please add key to github and press enter to continue."
    if read_confirm
        echo (set_color green) "cloning dotfiles..."(set_color normal)
        git clone git@github.com:NerdySouth/dotfiles.git
        cd dotfiles
        git checkout shadowrealm
        echo (set_color green) "Setting up links to dotfiles" (set_color normal)
        cp -rsvf $(pwd)/waybar ~/.config/
        cp -rsvf $(pwd)/alacritty ~/.config/
        cp -rsvf $(pwd)/fish ~/.config/
        mkdir -pv ~/Pictures/Wallpapers
        cp -rsvf $(pwd)/BigSur ~/Pictures/Wallpapers/
        cp -rsvf $(pwd)/fuzzel ~/.config/
        cp -rsvf $(pwd)/hypr ~/.config/
        cp -rsvf $(pwd)/macchina ~/.config/
        cp -rsvf $(pwd)/mako ~/.config
        cp -rsvf $(pwd)/newboat ~/.config
        cp -rsvf $(pwd)/nvim ~/.config/
        cp -rsvf $(pwd)/tmux ~/.config/
        cp -rsvf $(pwd)/waybar ~/.config/
        mkdir -pv ~/bin
        fish_add_path ~/bin
        cp -rsvf $(pwd)/sunpaper.sh ~/bin/
        echo (set_color green) "Done!" (set_color normal)
    end
end

function setup_pkgconf

    echo "Setting up makepkg to use memory-based files to speed up compiles"
    mkdir -pv ~/.config/pacman
    mkdir -pv ~/the-source
    sudo cp /etc/makepkg.conf /home/tristen/.config/pacman
    sudo chown -R tristen /home/tristen/.config/pacman

    set CONF ~/.config/pacman/makepkg.conf

    # turn on native optimizations
    sed -i s/-march=x86-64[[:space:]]-mtune=generic/-march=native/ $CONF

    # enable parallel compilation
    sed -i s/^\#MAKEFLAGS=\"-j.\*\"/MAKEFLAGS=\"-j12\"/ $CONF

    # enable use of tmpfs for building, uses memory file IO
    sed -i s/^\#BUILDDIR/BUILDDIR/ $CONF

    # enable native opts for rust
    echo "RUSTFLAGS=\"-C opt-level=2 -C target-cpu=native\"" >>$CONF
    echo "PKGDEST=\"/home/tristen/bin/\"" >>$CONF
    echo "SRCDEST=\"/home/tristen/the-source\"" >>$CONF

    echo (set_color green)"Done!"(set_color normal)
end

setup_pkgconf
get_dotfiles
install_packages
