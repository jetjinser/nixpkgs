{ lib
, stdenv
, fetchFromGitLab
, autoreconfHook
, guile
, pkg-config
, texinfo
}:

stdenv.mkDerivation rec {
  pname = "guile-hoot";
  version = "0.5.0";

  src = fetchFromGitLab {
    owner = "spritely";
    repo = "guile-hoot";
    rev = "v${version}";
    hash = "sha256-n8u0xK2qDLGySxiYWH882/tkL8ggu3hivHn3qdDO9eI=";
  };

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];
  buildInputs = [
    guile
    texinfo
  ];

  makeFlags = [
    "GUILE_AUTO_COMPILE=0"
  ];

  configureFlags = [
    "--with-guile-site-dir=$(out)/${guile.siteDir}"
    "--with-guile-site-ccache-dir=$(out)/${guile.siteCcacheDir}"
  ];

  meta = {
    description = "Guile->WebAssembly";
    homepage = "https://gitlab.com/spritely/guile-hoot";
    license = lib.licenses.asl20;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
}
