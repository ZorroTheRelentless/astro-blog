{ pkgs }:
pkgs.buildNpmPackage {
  name = "blog";
  src = ../.;
  npmDepsHash = "sha256-7Vplo6JFKQR5iTLzRsAm5LC3TCiQOcScj3nJIEikJlg=";
  buildPhase = ''
    npm run build
    mkdir -p $out
    cp -r dist/* $out
  '';
}
