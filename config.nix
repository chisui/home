{
  allowUnfree = true;
  allowBroken = true;
  packageOverrides = pkgs: {
    nur = import /etc/nixos/nur.nix { inherit pkgs; };
  };
}

