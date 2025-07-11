#!/bin/bash
set -eu


depend=("figlet" "curl" "vim" "cp")
missing=()

for cmd in "${depend[@]}"; do

	if ! which "$cmd" &>/dev/null; then
		missing+=("$cmd")
	fi
done

if [[ "${#missing[@]}" -ne 0 ]]; then
    result="$(IFS=" "; echo "${missing[*]}")"
    echo -e "\x1b[31mError:\x1b[0m"
    echo "Missing software: ${result}" >&2
		echo "Please install missing software and retry this script" >&2
    exit 1
fi


figlet "vim-config"

echo "This installer is copy vimrc files to your home directory"
printf "Allow? "
read -n 1 key
echo


if [[ "$key" =~ ^(y|yes|Y)$ ]];then
	printf "\x1b[36m=>\x1b[0m cp ./vimrc \"$HOME/.vimrc\"\n"
	cp ./vimrc "$HOME/.vimrc"

	printf "\x1b[36m=>\x1b[0m curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\n"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	printf "\x1b[36m=>\x1b[0m vim +PlugInstall\n"
	vim +PlugInstall

fi

