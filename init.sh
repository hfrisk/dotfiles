#!/bin/bash
REPO_OWNER=hfrisk
REPO_NAME=dotfiles
BRANCH=dotter-migration

mkdir .dotfiles
if [$? -ne 0]; then
	echo "Error: Failed to create directory .dotfiles"
	exit 1
fi

#command -v git > /dev/null 2>&1 ||
#	{
		echo >&2 "Git is not installed. Falling back to wget."
		wget https://github.com/${REPO_OWNER}/${REPO_NAME}/archive/${BRANCH}.tar.gz -O- | tar -xz --strip-components=1 -C .dotfiles
#	}

cp .dotfiles/.dotter/local.t.toml .dotfiles/.dotter/local.toml

echo "dotfiles installed. Run ``.dotfiles/deploy.sh`` to deploy."
