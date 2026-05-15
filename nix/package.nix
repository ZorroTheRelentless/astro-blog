{
  pkgs,
  perSystem,
}:
let
  docs-package = pkgs.buildNpmPackage {
    name = "blog-package";
    src = ../.;
    npmDepsHash = "sha512-4RzeF6e9JfGUqUjrLQaYlsdxxiTAb2X0vDkVy3ICoArIDcC/1TU2JFwBavj1Gk71FU4ePrD21+2xInY1IB0iJw==";
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
