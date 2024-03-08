export PATH=~/.local/share/junest/bin:$PATH
export PATH=$PATH:~/.junest/usr/bin_wrappers

# Run zsh
if [ "$SHELL" != "/usr/bin/zsh" ]
then
    export SHELL="/usr/bin/zsh"
    exec /usr/bin/zsh
fi
