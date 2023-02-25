{ system ? builtins.currentSystem,
  lock ? builtins.fromJSON (builtins.readFile ./flake.lock),
  pkgs ? let
    nixpkgs = fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/${lock.nodes.nixpkgs.locked.rev}.tar.gz";
      sha256 = lock.nodes.nixpkgs.locked.narHash;
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
     dinosay = callPackage ./pkgs/dinosay { };
   }; 
in self 
