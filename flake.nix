{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            whisper-cpp-vulkan = prev.whisper-cpp.override {
              vulkanSupport = true;
              cudaSupport = false;
              rocmSupport = false;
              withFFmpegSupport = true;
              withSDL = false;
              ffmpeg = final.ffmpeg;
              shaderc = final.shaderc;
              vulkan-headers = final.vulkan-headers;
              vulkan-loader = final.vulkan-loader;
            };
          })
        ];
      };
      kotur-pkgs = import ./default.nix { inherit system pkgs; };
    in {
      packages = kotur-pkgs // { whisper-cpp-vulkan = pkgs.whisper-cpp-vulkan; };

      # Overlay for consumers (nixos-dotfiles home-manager, etc.)
      overlays.default = final: prev: {
        whisper-cpp-vulkan = prev.whisper-cpp.override {
          vulkanSupport = true;
          cudaSupport = false;
          rocmSupport = false;
          withFFmpegSupport = true;
          withSDL = false;
          ffmpeg = final.ffmpeg;
          shaderc = final.shaderc;
          vulkan-headers = final.vulkan-headers;
          vulkan-loader = final.vulkan-loader;
        };
      };
    });
}
