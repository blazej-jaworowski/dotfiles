export PATH=~/.local/share/junest/bin:$PATH
export PATH=$PATH:~/.junest/usr/bin_wrappers

# Run zsh
if [ "$SHELL" != "$(which zsh)" ]
then
    export SHELL="$(which zsh)"
    exec zsh
fi
