{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "leo";
  home.homeDirectory = "/home/leo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.tmux
    pkgs.gh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    "./.config/alacritty/alacritty.toml".text = ''
        [window]
        opacity = 0.75
	padding = { x = 5, y = 5}
	decorations = "None"

	[colors.primary]
	background = "#000000"

	[font]
	size = 11
    '';

    "./.config/nvim/init.vim".text = ''
	set number

	set noswapfile

	" Indentation
	set autoindent
	set shiftwidth=4	
    '';


    ".tmux.conf".text = ''
	#Add a mapping for reloading the conf file
	bind r source-file ~/.tmux.conf \; display-message "RELOADING CONFIGURATION FILE…"

	# remap prefix from 'C-b' to 'C-a'
	unbind C-b
	set-option -g prefix C-a
	bind-key C-a send-prefix

	# Enable mouse control (clickable windows, panes, resizable panes)
	set -g mouse on

	set -g status-style bg=white,fg=black

	# List of plugins
	set -g @plugin 'tmux-plugins/tpm'

	# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
	run '~/.tmux/plugins/tpm/tpm'
    '';

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/leo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      c = "clear";
      gcam = "git checkout master && git pull";
      count = "ls -1 | wc -1";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
