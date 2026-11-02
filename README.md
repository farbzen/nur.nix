<div align="center">

# nur.nix

_Personal [Nix User Repository](https://github.com/nix-community/NUR) with
packages, NixOS modules and overlays._

[![Nix Flake](https://img.shields.io/badge/Nix-flake-5277C3?style=flat-square&logo=nixos&logoColor=white)](flake.nix)
[![License: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

</div>

`nur.nix` is my personal NUR repository. It bundles self-made Nix packages,
NixOS modules and overlays for NixOS users and exposes them both through the
classic NUR channel (`nur.repos.farbzen`) and as a Nix flake.

## Binary Cache

CI builds all packages and pushes them to the
[Cachix](https://www.cachix.org/) cache `farbzen`. Use it to skip local builds:

```sh
cachix use farbzen
```

## License

See [LICENSE](LICENSE).
