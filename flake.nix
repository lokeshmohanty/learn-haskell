{
  description = "Learning Haskell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    package = self.packages.${system}.default;
    genApp = exec: { type = "app"; program = "${package}/bin/${exec}";};
  in {
    packages.${system} = {
      default = pkgs.stdenv.mkDerivation {
        name = "game";
        src = self;
        buildPhase = ''
          ${pkgs.ghc}/bin/ghc -o game ./game.hs
          ${pkgs.ghc}/bin/ghc -o solve ./solveGame.hs
        '';
        installPhase = ''
          mkdir -p $out/bin
          install -t $out/bin game
          install -t $out/bin solve
        '';
      };
    };
    apps.${system} = {
      game = genApp "game";
      solve = genApp "solve";
    };
    devShells.${system} = {
      default = pkgs.mkShell {
        packages = [pkgs.ghc];
        name = "learn-haskell";
        shellHook = "echo 'Hi, you have entered a dev shell!'";
      };
    };
    formatter.${system} = pkgs.alejandra;
  };
}
