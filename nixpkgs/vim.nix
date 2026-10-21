{ pkgs, config, lib, ... }:

let
  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
    # Plugins are loaded together in nvim, so they can't pass nixpkgs'
    # standalone require check (e.g. cmp-path needs nvim-cmp).
    doCheck = false;
  };
#  pluginNode = name: pkgs.vimUtils.buildVimPlugin {
#    pname = name;
#    inherit (nodePackages.${name}) version meta;
#    src = "${nodePackages.${name}}/lib/node_modules/${name}";
#  };
  # always installs latest version
  plugin = pluginGit "HEAD";
in {
#  xdg.configFile."nvim/coc-settings.json".source = config/nvim/coc-settings.json;
  xdg.configFile."nvim/lua".source = config/nvim/lua;

  programs.neovim = {
    package = pkgs.neovim-unwrapped;  # same nixpkgs as the plugins, so one LuaJIT

    # home-manager generates init.lua; load lua/init.lua from it.
    initLua = "require('init')";

    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;

    extraPackages = with pkgs; [
      pyright
      gcc
      svls  # SystemVerilog Language Server
      svlint  # SystemVerilog linter
      tree-sitter
      ripgrep
    ];

    extraPython3Packages = (ps: with ps; [
    ]);

    plugins = with pkgs.vimPlugins; [
#      coc-fzf
#      coc-git
#      coc-lists
#      coc-nvim
#      coc-pyright
#      coc-snippets
#      coc-yaml
#      fzf-vim
#      haskell-vim
      cmp-buffer  # Nvim-cmp support for buffer words
      cmp-cmdline  # Nvim-cmp support for nvim command mode and search
      fuzzy-nvim  # Abstraction layer for fzf and fzy
      cmp-fuzzy-buffer  # Nvim-cmp fuzzy finder buffer source
      cmp_luasnip  # Nvim-cmp support for luasnip
      cmp-nvim-lsp  # Nvim-cmp support for nvim LSP
      cmp-path  # Nvim-cmp support for filesystem paths
      hop-nvim  # Quick navigation written in lua
      indent-blankline-nvim  # Indent guides
      leap-nvim  # Motions
      lsp-status-nvim  # LSP status line component
      lualine-nvim  # Statusline
      luasnip  # LuaSnip snippets
#      neco-ghc
      neogit  # Git tool
#      nerdcommenter
#      nerdtree
      nvim-cmp  # Completion engine
      nvim-cursorline  # Cursorline highlighter
      nvim-lspconfig  # Language server configurator
      nvim-web-devicons  # Icon package
      nvim-tree-lua  # Filetree viewer
      nvim-solarized-lua  # Solarized theme
      # Treesitter: prebuilt grammars from nixpkgs; highlighting and selection are
      # built into Neovim (see config/nvim/lua/plugins/tree-sitter.lua).
      (nvim-treesitter.withPlugins (p: with p; [ bash c ini lua nix python systemverilog vim vimdoc query ]))  # Parsers and indentation
      nvim-treesitter-textobjects  # Function/class text objects
      rainbow-delimiters-nvim  # Rainbow parentheses (replaces archived nvim-ts-rainbow)
      plenary-nvim  # Lua library for Neovim
      popup-nvim  # Lua library for popups
      vim-repeat  # Repeat functionality for plugins
#      tagbar
      telescope-nvim  # File search utility
      telescope-fzf-native-nvim
      vim-nix
      (plugin "meltonbw/vim-snippets")  # Code snippets
      which-key-nvim  # Vim key command reference
    ];
  };
}
