#!/bin/bash
sudo apt update && 
sudo apt install git -y
git clone git@github.com:socproof/infra.git
cd infra
./install_ruby.sh &&
./install_mongodb.sh &&
./deploy.sh