{ pkgs, lib, ... }:

pkgs.buildGoPackage {
  name = "wally-cli";
  goPackagePath = "github.com/zsa/wally-cli";

  src = pkgs.fetchFromGitHub {
    owner = "zsa";
    repo = "wally-cli";
    rev = "5c536c2c4ca974fb83495d040e69da4a8051eaa3";
    sha256 = "07spp3mvkqp0grn2hwgsghrw9136i0v2rxyf8zymvdqniwlabad5";
  };

  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ libusb ];
  goDeps = ./deps.nix;

  meta = with lib; {
    description = "Upload Ergodox keyboard ROM's";
    license = licenses.mit;
    homepage = https://github.com/zsa/wally;
  };
}
