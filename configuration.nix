
{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

    # BOOTLOADER - GRUB
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    # boot.loader.grub.enableCryptodisk = true;

    # BOOTLOADER - GRUB - BIOS
        # boot.loader.grub.efiSupport = true;
        # boot.loader.grub.efiInstallAsRemovable = true;
        # boot.loader.efi.efiSysMountPoint = "/boot/efi";
        # boot.loader.grub.device = "nodev";
        # boot.loader.grub.enableCryptodisk = true;

    # NETWORKING
    time.timeZone = "US/Eastern";
    i18n.defaultLocale = "en_US.UTF-8";
    networking.hostName = "nixos";
    console = {
        font = "Lat2-Terminus16";
        # keyMap = "us";
        useXkbConfig = true; # use xkbOptions in tty.
        };
    # Pick only one of the below networking options.
        # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
        # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    # Configure network proxy if necessary
        # networking.proxy.default = "http://user:password@proxy:port/";
        # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable CUPS to print documents.
        # services.printing.enable = true;

    # Enable sound.
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
        # services.xserver.libinput.enable = true;

    # Enable shells
    programs.bash = {
        promptInit = "source ~/.config/bash/.bashrc";
    };

    environment.shells = with pkgs; [ zsh ];
    programs.zsh = {
        enable = true;
        promptInit = "source ~/.config/zsh/.zshrc";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.windowManager.dwm.enable = true;
    services.xserver.layout = "us";
    # services.xserver.xkbOptions = "eurosign:e,caps:escape";

    # DWM settings
    nixpkgs.overlays = [
        (final: prev: {
            dmenu = prev.dmenu.overrideAttrs (old: { src = /home/dave/.local/src/dmenu ;});
            dwm = prev.dwm.overrideAttrs (old: { src = /home/dave/.local/src/dwm ;});
            dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = /home/dave/.local/src/dwmblocks ;});
         })
    ];

    # Allow unfree for Steam
    nixpkgs.config.allowUnfree=true;

    # To search, run: $ nix search wget
    environment.systemPackages = with pkgs; [
        (st.overrideAttrs (oldAttrs: rec {
            buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
            src = /home/dave/.local/src/st ;
            }))
        abook
        arandr
        arc-theme
        atool
        bat
        bc
        curl
        dejavu_fonts
        dmenu
        dosfstools
        dunst
        dwm
        dwmblocks
        exfatprogs
        ffmpeg
        ffmpegthumbnailer
        font-awesome
        fzf
        gnome.gnome-keyring
        harfbuzz
        htop
        lf
        libnotify
        librewolf
        libertine
        lynx
        maim
        man
        mediainfo
        moreutils
        mpc-cli
        mpd
        mpv
        ncmpcpp
        neovim
        newsboat
        noto-fonts
        noto-fonts-emoji
        nsxiv
        ntfs3g
        pamixer
        pipewire
        polkit
        poppler
        pulsemixer
        python311Packages.qdarkstyle
        sc-im
        simple-mtpfs
        slock
        socat
        st
        stdenv
        sudo
        taskspooler
        terminus_font
        ueberzug
        unclutter
        unzip
        wireplumber
        xcape
        xclip
        xcompmgr
        xdotool
        xorg.xbacklight
        xorg.xinit
        xorg.xorgserver
        xorg.xprop
        xorg.xwininfo
        xwallpaper
        yt-dlp
        vim
        wget
        zathura
        zsh
    ];

    users.users.dave= {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
            brave
            celluloid
            eww
            feh
            flameshot
            gh
            gimp
            git
            hugo
            kitty
            lutris
            neofetch
            openvpn
            powershell
            qemu
            steam
            sudo
            synergy
            thunderbird
            tldr
            tree
            virt-manager
            xfce.thunar
        ];
    };

    # Some programs need SUID wrappers, can be configured further or are started in user sessions.
        # programs.mtr.enable = true;
        # programs.gnupg.agent = {
        #   enable = true;
        #   enableSSHSupport = true;
        # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
        # services.openssh.enable = true;

    # Open ports in the firewall.
        # networking.firewall.allowedTCPPorts = [ ... ];
        # networking.firewall.allowedUDPPorts = [ ... ];
        # Or disable the firewall altogether.
        networking.firewall.enable = false;

    # Copy the NixOS configuration file and link it from the resulting system
        # (/run/current-system/configuration.nix). This is useful in case you
        # accidentally delete configuration.nix.
        # system.copySystemConfiguration = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        system.stateVersion = "23.05"; # Did you read the comment?
}
