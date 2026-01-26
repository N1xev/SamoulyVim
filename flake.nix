{

  description = "SamoulyVim - Isolated Neovim Configuration";


  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    opencode-flake.url = "github:aodhanhayter/opencode-flake";

  };


  outputs = { self, nixpkgs, opencode-flake }: 

    let

      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};

      opencode = opencode-flake.packages.${system}.default;



      extraPackages = with pkgs; [

        ripgrep fd lazygit gh gcc git go rustup nodejs python3

        lua-language-server nil

        stylua

        opencode

      ];

    in {

      packages.${system}.default = pkgs.writeShellApplication {

        name = "slvim";

        runtimeInputs = [ pkgs.neovim ] ++ extraPackages;

        text = ''

          export NVIM_APPNAME="slvim"

          export XDG_DATA_HOME="$HOME/.local/share/slvim"

          export XDG_STATE_HOME="$HOME/.local/state/slvim"


          exec nvim "$@"

        '';

      };

    };

}
