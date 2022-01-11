self: super: {

  installApplication = {
    name, appname ? name, version, src, description, homepage,
    postInstall ? "", sourceRoot ? ".", ...
  }: with super; stdenv.mkDerivation {
    name = "${name}-${version}";
    version = "${version}";
    src = src;
    buildInputs = [ undmg unzip ];
    sourceRoot = sourceRoot;
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications/${appname}.app"
      cp -pR * "$out/Applications/${appname}.app"
    '' + postInstall;
    meta = with lib; {
      description = description;
      homepage = homepage;
      maintainers = with maintainers; [ cmacrae ];
      platforms = platforms.darwin;
    };
  };

#  Firefox = self.installApplication rec {
#    name = "Firefox";
#    version = "65.0.1";
#    sourceRoot = "Firefox.app";
#    src = super.fetchurl {
#      name = "Firefox-${version}.dmg";
#      url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
#      sha256 = "0rc9llndc03ns69v5f94g83f88qav0djv6lw47l47q5w2lpckzv9";
#    };
#    description = "Free and open-source web browser developed by Mozilla Foundation";
#    homepage = https://www.mozilla.org/en-US/firefox;
#  };

  iTerm2 = self.installApplication rec {
    inherit (builtins) replaceStrings;
    name = "iTerm2";
    appname = "iTerm";
    version = "3.4.10";
    sourceRoot = "iTerm.app";
    src = super.fetchurl {
      url = "https://iterm2.com/downloads/stable/iTerm2-${replaceStrings ["\."] ["_"] version}.zip";
      sha256 = "40a62193582dd7c54e6f27e509bdb887ec864513b53d4003763d9e167e44a921";
    };
    description = "iTerm2 is a replacement for Terminal and the successor to iTerm";
    homepage = https://www.iterm2.com;
  };

#  XQuartz = self.installApplication rec {
#    name = "XQuartz";
#    appname = "XQuartz-2.8.1";
#    version = "2.8.1";
#    sourceRoot = "XQuartz.app";
#    src = super.fetchurl {
#      name = "XQuartz-${version}.dmg";
#      url = "https://github.com/XQuartz/XQuartz/releases/download/XQuartz-${version}/XQuartz-${version}.dmg";
#      sha256 = "0fwya2mb66w62f6kn46px4gy53w5wcaqlslsvww5fygkz3rpgd0f";
#    };
#    description = "The XQuartz project is an open-source effort to develop a version of the X.Org X Window System that runs on macOS";
#    homepage = https://www.xquartz.org;
#  };
}
