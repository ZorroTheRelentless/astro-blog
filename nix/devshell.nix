
{
  pkgs,
  inputs,
  ...
}:
let
  src = ../.;
in
pkgs.mkShell {
  packages =
    with pkgs;
    [
        nodejs
    ];
}
