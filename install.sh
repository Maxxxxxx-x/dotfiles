#!/usr/bin/env bash
sudo apt update && sudo apt upgrade -y
sudo apt install nala

sudo nala install bison bsdmainutils binutils gcc make build-essential libreadline-dev unzip -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://github.com/neovim/neovim/releases/download/v0.12.4/nvim-linux-x86_64.tar.gz
tar xvzf nvim-linux-x86_64.tar.gz
rm *.tar.gz
mv nvim* nvim
sudo mv nvim /opt
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim

curl -fsSL https://bun.sh/install | bash


bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

wget https://go.dev/dl/go.1.26.5.linux-amd64.tar.gz
tar xvzf go1.26.5-linux-amd64.tar.gz
rm go1.26.5-linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"
sudo mv -r ./go /usr./local

go env -w $HOME/.local/share/go
go env -w GOPATH=$HOME/.local/share/go

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | bash
nvm install 26

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup upgrade
rustc update

sudo nala install python3 python3-venv

curl -L -R -O https://www.lua.org/ftp/lua-5.5.0.tar.gz
tar zxf lua-5.5.0.tar.gz
cd lua-5.5.0
make all test
cd ..

sudo nala install lua5.1

sudo mv lua-5.5.0 /usr/local
sudo ln -s /usr/local/lua-5.5.0/src/lua /usr/local/bin
./configure && make && sudo amke install


wget https://luarocks.org/releases/luarocks-3.13.0.tar.gz
tar xzpf luarocks-3.13.0.tar.gz
rm luarocks-3.13.0.tar.gz
cd luarocks-3.13.0

sh -c "$(curl -s https://raw.githubusercontent.com/ibhagwan/fzf-lua/main/scripts/mini.sh)"
sudo nala install fzf

sudo nala install expat libxml2-dev  pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev libfontconfig1-dev g++

sudo nala install bat fastfetch ripgrep


cargo install silicon


wget https://github.com/UpliftGames/wally/releases/download/v0.3.2/wally-v0.3.2-linux.zip
unzip wally-v0.3.2-linux.zip
rm wally-v0.3.2-linux.zip
sudo mv wally /usr/local/bin

curl -sSf https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.sh | bash

cargo install stylua --features luau
cargo install --branch main --git https://github.com/Kampfkarren/selene selene

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

wget https://github.com/jqlang/jq/releases/download/jq-1.8.2/jq-linux-amd64
chmod +x ./jq-linux-amd64
mv jq-linux-amd64 jq
sudo mv jq /usr/local/bin

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

sudo nala install podman

sudo apt install ca-certificates

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d << EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: trixie
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo nala update
sudo nala install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
go install github.com/pressly/goose/v3/cmd/goose@latest
