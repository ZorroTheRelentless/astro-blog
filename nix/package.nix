{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "blog";
  src = ../src;
  buildInputs = [ pkgs.deno pkgs.nodejs ];
  buildPhase = ''
    zola build
    cp -r public $out
  '';
}
