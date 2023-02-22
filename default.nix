{ system ? builtins.currentSystem }:

let
   pkgs = import <nixpkgs> { inherit system; };

   callPackage = pkgs.lib.callPackageWith (pkgs // self); 

   self = { 
    cpp-jwt = callPackage ./dependencies/cpp-jwt { };
    cpp-rest-server = callPackage ./projects/cpp-rest-server { };
   }; 
in self
