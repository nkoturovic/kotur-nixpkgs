{ stdenv
, lib
, fetchFromGitHub
, cmake
, nlohmann_json
, openssl
}:
let
in stdenv.mkDerivation (finalAttrs: {
  pname = "cpp-jwt";
  version = "1.4";

  src = fetchFromGitHub {
    owner = "arun11299";
    repo = "cpp-jwt";
    rev = "v${finalAttrs.version}";
    hash = "sha256-5hVsFanTCT/uLLXrnb2kMvmL6qs9RXVkvxdWaT6m4mk=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ nlohmann_json openssl ];

  cmakeFlags = [
    "-DCPP_JWT_BUILD_EXAMPLES=OFF"
    "-DCPP_JWT_BUILD_TESTS=OFF"
    "-DCPP_JWT_USE_VENDORED_NLOHMANN_JSON=OFF"
    "-DCMAKE_INSTALL_INCLUDEDIR=${out}"
    "-DCMAKE_INSTALL_DATADIR=${out}"
  ];

  meta = with lib; {
    description = "C++ json web token library";
    homepage = "https://github.com/arun11299/cpp-jwt";
    changelog = "https://github.com/arun11299/cpp-jwt/compare/v1.3...v1.4";
    license = licenses.mit;
    platforms = platforms.all;
  };
})
