{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "blog";
  src = ../src;
  buildInputs = [ pkgs.zola ];
  buildPhase = ''
    zola build
    cp -r public $out
  '';
}
