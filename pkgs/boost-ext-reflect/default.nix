{ stdenv
, lib
, fetchFromGitHub
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "boost-ext-reflect";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "boost-ext";
    repo = "reflect";
    rev = "v${finalAttrs.version}";
    hash = "sha256-EjN/9EIQMk4I4hERxykPs2qjSJMjR2+ifV6zKn/Vtwc=";
  };

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p $out/include/boost-ext
    cp $src/reflect $out/include/boost-ext/reflect.hpp
   '';

  meta = with lib; {
    description = "C++ reflection library";
    homepage = "https://github.com/boost-ext/reflect";
    license = licenses.boost;
    platforms = platforms.all;
  };
})
