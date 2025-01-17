{ ... }: {
  # Enables autocompletion for system level binaries.
  # This is necessary because zsh is installed as a user package.
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.christian = {
    programs.zsh = {
      enable = true;

      enableAutosuggestions = true;

      envExtra = ''
        loc() { find . -name "*.$1" | xargs wc -l }; todos() {find . -regex ".*\.md" | xargs tail -n +1 | grep -P "(^\#\s\w+)|(\s*\-\s\[\s\])" | glow -}'';

      oh-my-zsh = {
        enable = true;
        custom = "$HOME/.config/oh-my-zsh";
        theme = "typewritten";
      };
    };

    home.file.typewritten-theme = {
      source = ./typewritten.zsh-theme;
      target = ".config/oh-my-zsh/themes/typewritten.zsh-theme";
    };
  };
}
