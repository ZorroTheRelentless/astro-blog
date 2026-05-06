{ pkgs }:
let
  docs-package = pkgs.buildNpmPackage {
    name = "blog-package";
    src = ../.;
    npmDepsHash = "sha256-7Vplo6JFKQR5iTLzRsAm5LC3TCiQOcScj3nJIEikJlg=";
    buildPhase = ''
      npm run build
      mkdir -p $out
      cp -r dist/* $out
    '';
};
in pkgs.stdenv.mkDerivation {
  name = "blog";
  src = ../.;
  buildPhase = ''
    mkdir -p $out
    find ${docs-package}/ -mindepth 1 -maxdepth 1 ! -name 'lib' -exec cp -r {} $out/ \;
  '';
}
