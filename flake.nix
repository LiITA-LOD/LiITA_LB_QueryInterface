{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {};
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            just
            yarn
            maven
            zulu8
          ];
          shellHook = ''
            # NOTE: this flags avoids ERR_OSSL_EVP_UNSUPPORTED
            export NODE_OPTIONS=--openssl-legacy-provider
          '';
        };
      }
    );
}
