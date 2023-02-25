{ lib
, fetchFromGitHub
, python3
}:

python3.pkgs.buildPythonApplication rec {
  pname = "dinosay";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "MatteoGuadrini";
    repo = "dinosay";
    rev = "${version}";
    hash = "sha256-5HOzMgDLX1vnUmEgMjluAsLfMCLt0YUT/pZAxMr7rLs=";
  };

  meta = with lib; {
    description = "C++ json web token library";
    homepage = "https://github.com/MatteoGuadrini/dinosay";
    changelog = "https://github.com/MatteoGuadrini/dinosay/compare/1.1.0..1.2.0";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
