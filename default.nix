{ system ? builtins.currentSystem }:

let
   pkgs = import <nixpkgs> { inherit system; };

   callPackage = pkgs.lib.callPackageWith (pkgs // self); 

   self = { 
    cpp-jwt = callPackage ./pkgs/lammps { };
   }; 
in self
