# This is a repository created by me to practice Haskell

## Basic Commands

- Run interactive compiler
```
  stack exec -- ghci
```

- Compile a `.hs` file
```
  stack exec -- ghc <fileName>
```

- Run a `.hs` file without creating any files
```
  stack exec -- runghc <fileName>
```

## Useful built-in libraries

- list
- string : text, bytestring

## Game (using nix)

- To run the game, `nix run github:lokeshmohanty/learn-haskell#game`
- To run the solver, `nix run github:lokeshmohanty/learn-haskell#solve`
- To get them in your shell, `nix shell github:lokeshmohanty/learn-haskell`
