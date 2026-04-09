{ config, pkgs, lib, inputs, ... }:

{
  
  environment.variables = {
      NH_FLAKE = "$HOME/.dotfiles/nixos/";
      NH_OS_FLAKE = "$HOME/.dotfiles/nixos/";
      };


  programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "$HOME/.dotfiles/nixos/";
  };

}

#####  END OF FILE  #####
