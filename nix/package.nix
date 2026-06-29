{
  pkgs,
  perSystem,
}:
let
  docs-package = pkgs.buildNpmPackage {
    name = "blog-package";
    src = ../.;
    npmDepsHash = "sha256-CvzxrMa+VeON4k/T1cM9w6FMZhN+g6BZOlEcyQDo3/4=";
    buildPhase = ''
      mkdir -p public/cv
      cp -r ${perSystem.cv.default}/* public/cv
      npm run build
      mkdir -p $out
      cp -r dist/* $out
    '';
  };
in
pkgs.stdenv.mkDerivation {
  name = "blog";
  src = ../.;
  buildPhase = ''
    mkdir -p $out
    find ${docs-package}/ -mindepth 1 -maxdepth 1 ! -name 'lib' -exec cp -r {} $out/ \;
  '';
}
