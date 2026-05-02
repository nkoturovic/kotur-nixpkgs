{ pkgs }:

pkgs.whisper-cpp.override {
  vulkanSupport = true;
  cudaSupport = false;
  rocmSupport = false;
  withFFmpegSupport = true;
  withSDL = false;
  ffmpeg = pkgs.ffmpeg;
  shaderc = pkgs.shaderc;
  vulkan-headers = pkgs.vulkan-headers;
  vulkan-loader = pkgs.vulkan-loader;
}
