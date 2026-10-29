#! /bin/sh

if ! npm -v 2>&1 1>/dev/null; then
	echo 'npm not install yet'
	exit 1
else
	echo 'init node project and typescript'
	npm init -y &>/dev/null
	npm i --save-dev typescript esbuild obsidian &>/dev/null
	npx tsc --init &>/dev/null
fi

if [ ! -d .git ]; then
	echo 'init git repository'
	git init &>/dev/null
fi

mkdir -p srcs
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/blob/main/srcs/main.ts" > srcs/main &>/dev/null
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/main/Makefile" > Makefile &>/dev/null
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/blob/main/.gitignore" > .gitignore &>/dev/null
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/blob/main/manifest.json" > manifest.json &>/dev/null
