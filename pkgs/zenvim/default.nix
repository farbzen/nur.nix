{
  lib,
  pkgs,
  fetchFromGitHub,
  profile ? "full",
}: let
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "farbzen";
    repo = "zenvim.nix";
    tag = "v${version}";
    hash = "sha256-rrBuPEDZxSnr6Xp1UdHmsU+2ZKLKpfzkDlIW/Ey44Ns=";
  };

  lockedNixvim = (lib.importJSON "${src}/flake.lock").nodes.nixvim.locked;

  nixvim = fetchFromGitHub {
    inherit (lockedNixvim) owner repo rev;
    hash = lockedNixvim.narHash;
  };

  nixvimLib = lib.extend (import "${nixvim}/lib/overlay.nix");

  configuration = nixvimLib.nixvim.evalNixvim {
    modules =
      [
        "${src}/profiles/full.nix"
        {nixpkgs.pkgs = pkgs;}
      ]
      ++ lib.optional (profile == "minimal") "${src}/profiles/minimal.nix";
  };
in
  configuration.config.build.package.overrideAttrs (previousAttrs: {
    name = "zenvim${lib.optionalString (profile == "minimal") "-mini"}-${version}";
    inherit version;

    meta =
      previousAttrs.meta
      // {
        description = "Batteries-included Neovim configuration built with Nixvim (${profile} profile)";
        homepage = "https://github.com/farbzen/zenvim.nix";
        changelog = "https://github.com/farbzen/zenvim.nix/blob/v${version}/CHANGELOG.md";
        license = lib.licenses.mit;
        platforms = lib.platforms.linux;
        mainProgram = "nvim";
        maintainers = [
          {
            email = "dev@farbzen.de";
            github = "farbzen";
            githubId = 60570640;
            name = "Fabian Meier";
          }
        ];
      };
  })
