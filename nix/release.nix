let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs { };
  tex = import ./tex-toolchain.nix { inherit pkgs; };
  inherit (import sources."gitignore.nix" { inherit (pkgs) lib; }) gitignoreSource;
in
pkgs.callPackage ./build.nix {
  inherit gitignoreSource;
  inherit tex;
}
