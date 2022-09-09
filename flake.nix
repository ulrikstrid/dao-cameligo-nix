{
  inputs = {
    nixpkgs.url = "github:nix-ocaml/nix-overlays";
    ligo = {
      url = "gitlab:ligolang/ligo";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ligo, nixpkgs, ... }: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        ligo.packages.x86_64-linux.default
        pkgs.esy
        pkgs.nodejs
      ];
    };
  }; 
}