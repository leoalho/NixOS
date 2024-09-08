## My NixOS configuration
### Running on a new machine
1. Install NixOS
2. Generate configuration files by running `nixos-create-config`
3. Add git to configuration.nix's environment.systemPackages
4. Add flakes support by appending `nix.settings.experimental-features = ["nix-command" "flakes"];`
5. Rebuild `nixos-rebuild switch`
6. Clone this repo to your destination of choice (I go with ~/.dotfiles for the time being)
7. Install [home-manage](https://nix-community.github.io/home-manager/)
8. Switch to the current version `nixos-rebuild switch --flake . --impure` (Impure, because we do not provide hardware configuration, since it is machine dependant)
9. Switch to the current version of home-manager `home-manager switch --flake .`
