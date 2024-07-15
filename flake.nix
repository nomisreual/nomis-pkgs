{
  description = "Nomis PKGS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = nixpkgs.legacyPackages.${system};
    system = "x86_64-linux";
  in
  {
    packages.${system}.python311 = pkgs.writeShellScriptBin "python" ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      exec ${pkgs.python312}/bin/python "$@"
    '';
  };
}
