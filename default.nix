{ pkgs ? import <nixpkgs> { } }:

let
  version = "3.4.1";
in
pkgs.stdenv.mkDerivation {
  name = "perfmode";
  version = version;

  src = pkgs.fetchFromGitHub {
    owner = "icebarf";
    repo = "perfmode";
    tag = version;
    hash = "sha256-MEo7ZCkuN1Bbv7fNb0OGpc7auHBhIE0PcketWWCEETk=";
  };

  makeFlags = [ "PREFIX=${placeholder "out"}" ];

  meta = {
    description = "Fan/Performance Control for ASUS TUF Gaming laptops";
    license = pkgs.lib.licenses.gpl3Only;
    mainProgram = "perfmode";
  };
}
