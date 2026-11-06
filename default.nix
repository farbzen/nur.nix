{pkgs ? import <nixpkgs> {}}: {
  lib = import ./lib;
  modules = import ./modules;
  overlays = import ./overlays;

  narf = pkgs.callPackage ./pkgs/narf {};
  mixedupmh = pkgs.callPackage ./pkgs/mixedupmh {};
  zenvim = pkgs.callPackage ./pkgs/zenvim {};
  zenvim-mini = pkgs.callPackage ./pkgs/zenvim {profile = "minimal";};
}
