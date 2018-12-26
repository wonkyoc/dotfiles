#!/usr/bin/env bash

# Install neovim
# brew install neovim

# Install vim-plug
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

CWD="$(pwd)"

# printf
source ./message

link() {
    # Force create/replace the symlink.
    ln -fs "${CWD}/${1}" "${HOME}/${2}"
}

copy_files() {
    link "bashrc" ".bashrc"
    link "bash_profile" ".bash_profile"
    link "bash_prompt" ".bash_prompt"
    link "bash_exports" ".bash_exports"
    link "bash_aliases" ".bash_aliases"
    link "gitconfig" ".gitconfig"
    link "gitignore_global" ".gitignore"
    link "vimrc" ".vimrc"
    e_success "Dotfiles update complete!"
}

seek_confirmation "Warning: This step may overwrite your existing dotfiles."

if is_confirmed; then
    copy_files
    source "${HOME}/.bash_profile"
else
    printf "Aborting...\n"
    exit 1
fi

