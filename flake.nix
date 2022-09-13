{
  inputs = {
    esy.url = "github:esy/esy";
    ligo.url = "gitlab:ligolang/ligo";
  };

  outputs = { self, ligo, esy, nixpkgs, ... }: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        ligo.packages.x86_64-linux.default
        esy.packages.x86_64-linux.default
        pkgs.nodejs
      ];
    };
  }; 
}
