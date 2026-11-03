{
  lib,
  rustPlatform,
  fetchFromGitHub,
  cargo-tauri,
  pkg-config,
  wrapGAppsHook4,
  glib-networking,
  openssl,
  webkitgtk_4_1,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "mixedupmh";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "farbzen";
    repo = "mixedupmh";
    tag = "v${finalAttrs.version}";
    hash = "sha256-x8AKYm7PnT/i14HXtsVThPL0SqDQ6YMl3+JbJKzteu0=";
  };

  cargoHash = "sha256-MIFh9wEQVE+SZPpyWL3KlgNCZhDXHEjkyOwobSBQmjs=";

  nativeBuildInputs = [
    cargo-tauri.hook
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    glib-networking
    openssl
    webkitgtk_4_1
  ];

  meta = {
    description = "Randomizer for Monster Hunter Wilds that rolls monsters and weapons for your hunting party";
    homepage = "https://github.com/farbzen/mixedupmh";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "mumh";
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
