{ ... }:

{
programs.ssh = {
  enable = true;
  enableDefaultConfig = false;
  matchBlocks = {
    "github.com" = {
      identityFile = "~/.ssh/github";  
    };
    "bazzite" = {
      user = "Lord_Mistborn";
      identityFile = "~/.ssh/hermes2bazzite";
      # hostname = "100.107.78.6";
    };
  };
};

}
