with import <nixpkgs> {};

let
  pythonPackages = python37Packages;
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
    python -m pip --disable-pip-version-check install \
                  -r requirements.txt \
                  ;
    # Install dev staff to .venv. Can't do so in buildInputs cause VSCode
    # does not see paths from /nix/store.
    python -m pip --disable-pip-version-check install \
              pylint \
              mypy \
              autopep8 \
              ;
  '';
}
