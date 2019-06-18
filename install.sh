#!/bin/bash
echo "----------------- START INITIAL --------------------"
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone https://github.com/socproof/infra.git
cd infra
bash packer/scripts/install_ruby.sh
bash packer/scripts/install_mongodb.sh
bash packer/scripts/deploy.sh
echo "----------------- END INITIAL --------------------"