_:

{
  programs.vscode.userSettings = {
    "workbench.startupEditor" = "newUntitledFile";
    "editor.rulers" = [ 80 ];
    "files.autoSave" = "afterDelay";
    "go.toolsManagement.autoUpdate" = true;
    "explorer.confirmDelete" = false;
    "workbench.editorAssociations" = {
      "*.ipynb" = "jupyter-notebook";
      "*.drawio" = "hediet.vscode-drawio-text";
    };
    "python.showStartPage" = false;
    "docker.showStartPage" = false;
    "notebook.cellToolbarLocation" = {
      "default" = "right";
      "jupyter-notebook" = "left";
    };
    "explorer.confirmDragAndDrop" = false;
    "editor.suggestSelection" = "first";
    "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";
    "hediet.vscode-drawio.theme" = "dark";
    "editor.unicodeHighlight.ambiguousCharacters" = false;
    "python.defaultInterpreterPath" = "/usr/bin/python3";
    "yaml.customTags" = [
      "!reference sequence"
      "!vault"
    ];
    "editor.renderWhitespace" = "all";
    "terminal.integrated.defaultProfile.linux" = "zsh";
    "terminal.integrated.gpuAcceleration" = "canvas";
    "[python]" = {
      "editor.formatOnType" = true;
    };
    "editor.minimap.enabled" = false;
    "gitlens.blame.highlight.locations" = [
      "gutter"
      "line"
      "overview"
    ];
    "gitlens.changes.locations" = [
      "gutter"
      "line"
      "overview"
    ];
    "gitlens.heatmap.locations" = [
      "gutter"
      "line"
      "overview"
    ];
    "gitlens.codeLens.recentChange.enabled" = false;
    "gitlens.codeLens.authors.enabled" = false;
    "update.showReleaseNotes" = false;
    "github.gitAuthentication" = false;
    "github.gitProtocol" = "ssh";
    "editor.unicodeHighlight.invisibleCharacters" = false;
    "workbench.editor.empty.hint" = "hidden";
    "nxConsole.showNodeVersionOnStartup" = false;
    "editor.tabSize" = 2;
    "editor.detectIndentation" = false;
    "editor.fontFamily" = "'Firacoe Nerd Font', 'monospace', monospace";
    "terminal.integrated.fontFamily" = "'Firacoe Nerd Font', 'monospace', monospace";
    "editor.codeLensFontFamily" = "'Firacoe Nerd Font', 'monospace', monospace";
    "workbench.iconTheme" = "eq-material-theme-icons-light";
    "sops-edit.onlyUseButtons" = true;
  };
}
