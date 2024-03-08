#! /usr/bin/bash

git clone https://github.com/fsquillace/junest.git ~/.local/share/junest
export PATH="$HOME/.local/share/junest/bin:$PATH"

junest setup

echo '
## Poland
Server = https://mirror.eloteam.tk/archlinux/$repo/os/$arch
Server = http://ftp.icm.edu.pl/pub/Linux/dist/archlinux/$repo/os/$arch
Server = https://ftp.icm.edu.pl/pub/Linux/dist/archlinux/$repo/os/$arch
Server = http://mirror.juniorjpdj.pl/archlinux/$repo/os/$arch
Server = https://mirror.juniorjpdj.pl/archlinux/$repo/os/$arch
Server = http://arch.midov.pl/arch/$repo/os/$arch
Server = https://arch.midov.pl/arch/$repo/os/$arch
Server = http://mirror.onet.pl/pub/mirrors/archlinux/$repo/os/$arch
Server = http://piotrkosoft.net/pub/mirrors/ftp.archlinux.org/$repo/os/$arch
Server = http://ftp.psnc.pl/linux/archlinux/$repo/os/$arch
Server = https://ftp.psnc.pl/linux/archlinux/$repo/os/$arch
Server = http://arch.sakamoto.pl/$repo/os/$arch
Server = https://arch.sakamoto.pl/$repo/os/$arch
Server = http://repo.skni.umcs.pl/archlinux/$repo/os/$arch
Server = https://repo.skni.umcs.pl/archlinux/$repo/os/$arch
Server = http://ftp.vectranet.pl/archlinux/$repo/os/$arch
' > $HOME/.junest/etc/pacman.d/mirrorlist

junest sudo pacman -Syu --noconfirm
junest sudo pacman -Sy --noconfirm base-devel

export PATH="$PATH:$HOME/.junest/usr/bin_wrappers"

INSTALL_INSTRUCTION="junest sudo pacman -S --noconfirm" ./setup.sh
