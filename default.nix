{ pkgs, lib, buildGoPackage, fetchFromGitHub }:

buildGoPackage {
  name = "wally-cli";

  goPackagePath = "github.com/zsa/wally";
  subPackages = [ "cli" ];
  src = fetchFromGitHub {
    owner = "zsa";
    repo = "wally";
    rev = "311d39c33efcde5fde5f6ad79298258584f42ece";
    sha256 = "sha256:1hz5zzjffs90r720lqkchi6zfyz7gq7lpsmyf5psfa7l708nvayk";
  };
  patches = [ ./cli-only.patch ];
  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ libusb ];
  goDeps = ./deps.nix;

  postInstall = ''
    mv $out/bin/cli $out/bin/wally-cli
  '';

  meta = with lib; {
    description = "Upload ergodox CLI keyboard ROM's";
    license = licenses.mit;
    homepage = https://github.com/zsa/wally;
  };
}
