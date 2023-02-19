{ stdenv
, lib
, fetchFromGitHub
, cmake
, nlohmann_json
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
  buildInputs = [ nlohmann_json ];

  cmakeFlags = [
    "-DCPP_JWT_BUILD_EXAMPLES=OFF"
    "-DCPP_JWT_BUILD_TESTS=OFF"
    "-DCPP_JWT_USE_VENDORED_NLOHMANN_JSON=OFF"
    "-DCMAKE_INSTALL_INCLUDEDIR=$out"
    "-DCMAKE_INSTALL_DATADIR=$out"
  ];

  # doCheck = stdenv.hostPlatform == stdenv.buildPlatform;

  # skip tests that require git or modify “installed files”
  # preCheck = ''
  #   checkFlagsArray+=("ARGS=-LE 'not_reproducible|git_required'")
  # '';

  # postInstall = "rm -rf $out/lib64";

  meta = with lib; {
    description = "C++ json web token library";
    homepage = "https://github.com/arun11299/cpp-jwt";
    changelog = "https://github.com/arun11299/cpp-jwt/compare/v1.3...v1.4";
    license = licenses.mit;
    platforms = platforms.all;
  };
})
