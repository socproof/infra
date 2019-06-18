#!/bin/bash
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone https://github.com/socproof/infra.git
cd infra
bash install_ruby.sh
bash install_mongodb.sh
bash deploy.sh