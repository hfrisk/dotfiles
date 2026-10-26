#!/bin/bash
REPO_OWNER=hfrisk
REPO_NAME=dotfiles
BRANCH=dotter-migration

#command -v git > /dev/null 2>&1 ||
#	{
		echo >&2 "Git is not installed. Falling back to wget."
		wget https://github.com/${REPO_OWNER}/${REPO_NAME}/archive/${BRANCH}.tar.gz -O- | tar -xz --strip-components=1
#	}

cp .dotter/local.t.toml .dotter/local.toml

echo "dotfiles installed. Run ``./deploy.sh`` to deploy."
