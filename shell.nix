# with import (builtins.fetchGit {
#   # Descriptive name to make the store path easier to identify
#   name = "skillbox-python377-2020-01-13";
#   url = "https://github.com/nixos/nixpkgs/";
#   # Commit hash for nixos-unstable as of 2018-09-12
#   # `git ls-remote https://github.com/nixos/nixpkgs nixos-unstable`
#   ref = "refs/heads/master";
#   rev = "6328518e98e8097d79e49efa692c4babb2f0eda8";
# }) {};


# with import (builtins.fetchTarball {
#   # Descriptive name to make the store path easier to identify
#   name = "skillbox-python377-2020-01-13";
#   # Commit hash for nixos-unstable as of 2018-09-12
#   url = "https://github.com/nixos/nixpkgs/archive/60fb772ae293830d94908e6fad81b19eb21d0a2c.tar.gz";
#   # Hash obtained using `nix-prefetch-url --unpack <url>`
#   sha256 = "1skkl7l7qrxdgid2p03cgrca7p050xb45q0hihmqjl877i20v79b";
# }) {};

with import (builtins.fetchTarball {
  # Descriptive name to make the store path easier to identify
  name = "skillbox-python391-2020-12-18";
  # Commit hash for nixos-unstable as of 2018-09-12
  url = "https://github.com/nixos/nixpkgs/archive/abb757ba2877e9adb3e5f3a96864f5d96d73c47f.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "1a6bdnq1lnkz0if99kqbs54i2smxhpn9x3dvdln31h3bdhl5z6la";
}) {};

# with import <nixpkgs> {};

let
  pythonPackages = python39Packages;
in mkShell rec {
  name = "skillboxml";

  venvDir = "./.venv";

  # Customizable development requirements
  buildInputs = [
    pythonPackages.python
    pythonPackages.venvShellHook
  ];

  postShellHook = ''
    # NOTE: This thig is used to avoid some shit with zip and pylint in nix.
    #       See https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md#python-setuppy-bdist_wheel-cannot-create-whl
    #       and https://nixos.org/nixpkgs/manual/#python
    unset SOURCE_DATE_EPOCH

    make provision
  '';
}
