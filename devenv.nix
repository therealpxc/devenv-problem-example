{ pkgs, lib, config, inputs, ... }:

let
  brokepkgs = import inputs.brokepkgs { system = pkgs.stdenv.system; };
in
{

  pre-commit.hooks.trufflehog = {
    enable = true;

    # The name of the hook (appears on the report table):
    name = "Scan repository for secrets";

    # The command to execute (mandatory):
    # entry = "${brokepkgs.trufflehog}/bin/trufflehog --no-update --help";
    entry = "${inputs.useless.packages.${pkgs.stdenv.hostPlatform.system}.trufflehog}/bin/trufflehog --no-update --help";
    # entry = "${pkgs.trufflehog}/bin/trufflehog --no-update --help";

    # The pattern of files to run on (default: "" (all))
    # see also https://pre-commit.com/#hooks-files
    # files = "\\.(c|h)$";

    # List of file types to run on (default: [ "file" ] (all files))
    # see also https://pre-commit.com/#filtering-files-with-types
    # You probably only need to specify one of `files` or `types`:
    # types = [ "text" "c" ];

    # Exclude files that were matched by these patterns (default: [ ] (none)):
    # excludes = [ "irrelevant\\.c" ];

    # The language of the hook - tells pre-commit
    # how to install the hook (default: "system")
    # see also https://pre-commit.com/#supported-languages
    language = "system";

    # Set this to false to not pass the changed files
    # to the command (default: true):
    pass_filenames = false;
  };
}
