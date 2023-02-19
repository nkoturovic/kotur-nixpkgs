{ stdenv
, lib
, fetchFromGitHub
, cmake
, nlohmann_json
}:
let
in stdenv.mkDerivation (finalAttrs: {
  pname = "cpp-jwt";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "arun11299";
    repo = "cpp-jwt";
    rev = "v${finalAttrs.version}";
    hash = "sha256-SUdhIV7tjtacf5DkoWk9cnkfyMlrkg8ZU7XnPZd22Tw=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ nlohmann_json ];

  cmakeFlags = [
  ];

  # doCheck = stdenv.hostPlatform == stdenv.buildPlatform;

  # skip tests that require git or modify “installed files”
  # preCheck = ''
  #   checkFlagsArray+=("ARGS=-LE 'not_reproducible|git_required'")
  # '';

  # postInstall = "rm -rf $out/lib64";

  meta = with lib; {
    description = "C++ json web token library";
    # homepage = "https://json.nlohmann.me";
    # changelog = "https://github.com/nlohmann/json/blob/develop/ChangeLog.md";
    license = licenses.mit;
    platforms = platforms.all;
  };
})
