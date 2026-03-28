{ pkgs, ... }:
{
 services.tailscale.enable = true;

home-manager = {
 useUserPackages = true;
 useGlobalPkgs = true;
 backupFileExtension = "bak";

users = {
aaron = {
 home.stateVersion = "25.11";
 programs.home-manager.enable = true;

 imports = [
 ./hm/git.nix
 ];
};
};
};
}
