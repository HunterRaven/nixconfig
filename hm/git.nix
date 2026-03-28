{ ... }:
{

programs.git = {
  enable = true;
  settings = {
    user.email = "hunterraven2010@gmail.com";
    user.name = "HunterRaven";
    init.defaultBranch = "main";
    pull.rebase = false;
  };



  ignores = [
    ".direnv"
    "*.local"

  ];
};
}
