{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager.url = "github:rycee/home-manager/release-25.11";
    common.url = "git+https://git.joshuabell.xyz/ringofstorms/dotfiles?dir=flakes/common";
    ros_neovim.url = "git+https://git.joshuabell.xyz/ringofstorms/nvim";
    opencode.url = "github:anomalyco/opencode/0dcdf5f529dced23d8452c9aa5f166abb24d8f7c";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      common,
      ros_neovim,
      opencode,
      ...
    }:
    let
      hostname = "hermes";
      primaryUser = "aaron";
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        "${hostname}" = lib.nixosSystem {
          modules = [
            #nixosModule
            ./configuration.nix
            ./hardware-configuration.nix
            ./aaron.nix
            home-manager.nixosModules.default
            ({
              home-manager.sharedModules = [
                common.homeManagerModules.zsh
                common.homeManagerModules.foot
                common.homeManagerModules.direnv
                common.homeManagerModules.starship
                common.homeManagerModules.zoxide
                common.homeManagerModules.tmux
              ];
            })
            common.nixosModules.zsh
            common.nixosModules.jetbrains_font
            common.nixosModules.essentials
            ros_neovim.nixosModules.default
            (
              { pkgs, ... }:
              {
                ringofstorms-nvim = {
                  includeAllRuntimeDependencies = true;
                  underPrefix = "jnvim";
                };
                environment.systemPackages = [ opencode.packages.${pkgs.stdenv.hostPlatform.system}.default ];
              }
            )
          ];

        };
      };
    };
}
