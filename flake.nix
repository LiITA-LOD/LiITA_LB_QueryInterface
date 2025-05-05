{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            yarn
          ];
          shellHook = ''
            # NOTE: this flags avoids ERR_OSSL_EVP_UNSUPPORTED
            export NODE_OPTIONS=--openssl-legacy-provider
          '';
        };
        packages = rec {
          nodeModules = pkgs.mkYarnModules {
            pname = "node-modules";
            version = "0.1.0";
            packageJSON = ./package.json;
            yarnLock = ./yarn.lock;
          };
          frontend = pkgs.stdenv.mkDerivation {
            name = "frontend";
            src = ./.;
            buildInputs = [pkgs.yarn];
            configurePhase = ''
              ln -s ${nodeModules}/node_modules node_modules
              # NOTE: this flags avoids ERR_OSSL_EVP_UNSUPPORTED
              export NODE_OPTIONS=--openssl-legacy-provider
            '';
            buildPhase = ''
              yarn build
            '';
            installPhase = ''
              cp -r build $out
            '';
          };
          default = frontend;
        };
      }
    );
}
