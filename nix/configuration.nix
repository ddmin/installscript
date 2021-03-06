#  _   _ _       ___  ____
# | \ | (_)_  __/ _ \/ ___|
# |  \| | \ \/ / | | \___ \
# | |\  | |>  <| |_| |___) |
# |_| \_|_/_/\_\\___/|____/

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use the GRUB 2 boot loader
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Define on which hard drive you want to install Grub
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant

  # Set your time zone.
  time.timeZone = "America/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver = {
      enable = true;
      layout = "us";

      windowManager.qtile = {
        enable = true;
      };

      desktopManager.xterm.enable = false;

      displayManager = {
        defaultSession = "none+qtile";
        lightdm = {
            enable = true;
            greeter.enable = true;
        };
      };
  };

  # Enable compton
  services.compton.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ddmin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # fonts
  fonts.fonts = with pkgs; [
    nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # system
    cmake
    curl
    gnupg
    htop
    networkmanager
    pass
    wget
    xsel

    # programming
    gcc
    go
    python39
    rustup

    # terminal
    alacritty
    fzf
    git
    neovim
    powerline-go
    ranger
    vim

    # image
    feh
    gimp
    imagemagick
    ueberzug

    # video
    ffmpeg
    ffmpegthumbnailer
    mpv
    vlc

    # gui
    arc-theme
    firefox
    papirus-icon-theme

    # misc
    figlet
    neofetch
    rofi
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # garbage collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # NixOS version
  system.stateVersion = "21.05";
}
