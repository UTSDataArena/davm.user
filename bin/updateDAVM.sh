#!/bin/bash

# This script updates all the Data Arena Virtual Machine-related repositories
# [Darren 22Jan16]

cd

eval `ssh-agent`
ssh-add ~/.ssh/id_rsa_gitlab_deploy

export REPOS="
examples
davmdoc
videos
"

cd /local

for REPO_NAME in $REPOS
do
	if [[ -d $REPO_NAME ]]; then
		pushd $REPO_NAME
		# update repositories if already there
		git pull
		popd
	fi
done

cd /local/davmdoc && make html

cd

killall ssh-agent ssh-add

echo "Done updating"

