#  _   _ _       ___  ____
# | \ | (_)_  __/ _ \/ ___|
# |  \| | \ \/ / | | \___ \
# | |\  | |>  <| |_| |___) |
# |_| \_|_/_/\_\\___/|____/

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  ###################################################
  #               GRUB 2 Boot Loader                #
  # ----------------------------------------------- #
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;
  # ----------------------------------------------- #

  ###################################################
  #                 EFI Boot Loader                 #
  # ----------------------------------------------- #
  # boot.loader.grub.efiSupport = true;             #
  # boot.loader.grub.efiInstallAsRemovable = true;  #
  # boot.loader.efi.efiSysMountPoint = "/boot/efi"; #
  # ----------------------------------------------- #

  # Grub Installation Device (or "nodev" for EFI)
  boot.loader.grub.device = "/dev/sda";

  # Hostname
  networking.hostName = "nixos";

  # WPA_Supplicant
  networking.wireless.enable = true;

  # Time Zone
  time.timeZone = "America/New_York";

  # Networking
  networking.useDHCP = false;
  networking.interfaces.wlo1.useDHCP = true;
  networking.interfaces.enp0s3.useDHCP = true;

  # Internationalisation Properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # OpenSSH
  services.openssh.enable = true;

  # SUID Wrappers
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Users
  users.users.anon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  # X11 Windowing System
  services.xserver = {
      enable = true;
      layout = "us";

      desktopManager = {
        xfce.enable = true;
      };

      displayManager = {
        defaultSession = "xfce";
        lightdm = {
            enable = true;
            greeter.enable = true;
        };
      };
  };

  # Packages
  environment.systemPackages = with pkgs; [

    # System
    cmake
    curl
    git
    gnupg
    networkmanager
    rsync
    unzip
    wget
    xz

    # Utilities
    vim
    ranger
    dmenu
    scrot
    xterm
    htop

    # Programming
    gcc
    go
    python39
    python39Packages.pip
    rustup

    # GUI
    emacs
    feh
    firefox

  ];

  # Automatic Updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # NixOS Version
  system.stateVersion = "21.11";
}
