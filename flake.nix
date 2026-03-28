{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        home-manager.url = "github:rycee/home-manager/release-25.11";
    };

    outputs =
    { nixpkgs, home-manager, ... }:
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
                ];

            };
        };
    };
}
