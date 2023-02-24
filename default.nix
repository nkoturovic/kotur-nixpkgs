{ system ? builtins.currentSystem,
  pkgs ? let
    nixpkgs = fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/50c23cd4ff6c8344e0b4d438b027b3afabfe58dd.tar.gz";
      sha256 = "sha256-+peLp16ruWLuTFHo0ZUbLlS1/meS/+RsWQQ9bUAzOh8=";
    };
  in
    import nixpkgs {
      overlays = [];
      config = {};
      inherit system;
    },
 }:

 let
   callPackage = pkgs.lib.callPackageWith (pkgs // self); 
   self = { 
    cpp-jwt = callPackage ./pkgs/cpp-jwt { };
   }; 
in self
