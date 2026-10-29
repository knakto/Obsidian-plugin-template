#! /bin/sh

if ! npm -v 2>&1 1>/dev/null; then
	echo 'npm not install yet'
	exit 1
else
	echo 'init node project and typescript'
	npm init -y
	npm i --save-dev typescript esbuild obsidian
	npx tsc --init
fi

if [ ! -d .git ]; then
	echo 'init git repository'
	git init
fi

mkdir -p srcs
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/blob/main/srcs/main.ts" > srcs/main
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/main/Makefile" > Makefile
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/blob/main/.gitignore" > .gitignore
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/blob/main/manifest.json" > manifest.json
