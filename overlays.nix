{
  nixpkgs-old,
  repos,
  std2_ms-jpq,
}: [
  (final: prev: {
    luajitPackages.neotest = null;

    python312Packages = prev.python312Packages.override {
      overrides = pfinal: pprev: {
        std2 = pfinal.buildPythonPackage {
          pname = "std2";
          version = "0.1.10";
          pyproject = true;

          src = final.fetchFromGitHub {
            owner = "ms-jpq";
            repo = "std2";
            rev = "808a4ae1e050033a3863c35175894aa2a97320b2";
            hash = "sha256-Setty21ZMUAedN80ZwiMisQNiQmQR7E9khgVsExEHNc=";
          };

          nativeBuildInputs = [pfinal.setuptools];

          propagatedBuildInputs = [pfinal.pynvim];

          meta = with final.lib; {
            homepage = "https://github.com/ms-jpq/std2";
            description = "Dependency to chadtree and coq_nvim plugins";
            license = licenses.gpl3Plus;
            maintainers = with maintainers; [GaetanLepage];
          };
        };
      };
    };

    vimPlugins = let
      std2 = final.python312Packages.std2;
    in
      prev.vimPlugins
      // {
        nvim-lspimport = prev.vimUtils.buildVimPlugin {
          name = "nvim-lspimport";
          version = "2024-07-23";
          src = repos.nvim-lspimport;
        };

        copilot-status = prev.vimUtils.buildVimPlugin {
          name = "copilot-status";
          version = "2024-07-23";
          src = repos.copilot-status;
        };

        telescope-git-file-history = prev.vimUtils.buildVimPlugin {
          name = "telescope-git-file-history";
          version = "2024-08-04";
          src = repos.telescope-git-file-history;
        };

        coq_nvim = prev.vimPlugins.coq_nvim.overrideAttrs (oldAttrs: {
          passthru.python3Dependencies = ps:
            (builtins.filter (p: p.pname != "std2") (oldAttrs.passthru.python3Dependencies ps))
            ++ [std2];
        });

        chadtree = prev.vimPlugins.chadtree.overrideAttrs (oldAttrs: {
          passthru.python3Dependencies = ps:
            (builtins.filter (p: p.pname != "std2") (oldAttrs.passthru.python3Dependencies ps))
            ++ [std2];
        });
      };
  })
]
