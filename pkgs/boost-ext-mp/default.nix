{ stdenv
, lib
, fetchFromGitHub
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "boost-ext-mp";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "boost-ext";
    repo = "mp";
    rev = "v${finalAttrs.version}";
    hash = "sha256-UsnbPCyzJbPzo/kBDUHCI3ti7eAd4SAidUiU4bEGqjc=";
  };

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p $out/include/boost-ext
    cp $src/mp $out/include/boost-ext/mp.hpp
   '';

  meta = with lib; {
    description = "C++ metaprogramming library";
    homepage = "https://github.com/boost-ext/mp";
    license = licenses.boost;
    platforms = platforms.all;
  };
})
