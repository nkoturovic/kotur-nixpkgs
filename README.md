[![Built with nix](https://img.shields.io/static/v1?style=flat&logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org/)
[![kotur.me](https://img.shields.io/badge/Author-kotur.me-blue?style=flat)](https://kotur.me)

# kotur-nixpkgs

Custom nixpkgs channel repository

## Building packages

Building a package from the channel

```sh
# Building the dinosay package
nix-build -A dinosay # traditional way
nix build .#dinosay  # flakes way
./result/bin/dinosay -r "Hello $USER" # run dinosay
```

## Demo projects where this repo is used

- [cpp-nix-project-template](https://github.com/nkoturovic/cpp-nix-project-template) - C++ and nix starter project template
- [cpp-rest-server](https://github.com/nkoturovic/cpp-rest-server) - Demo showcase application
