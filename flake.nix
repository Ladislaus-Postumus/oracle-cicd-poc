{
  description = "Oracle XE + sqlcl devshell for vim-dadbod";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        pkgs.docker
        (pkgs.writeShellScriptBin "sqlplus" ''
          exec ./connect.sh "$@"
        '')
      ];
    };
  };
}

