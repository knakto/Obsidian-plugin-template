#! /bin/sh

if ! npm -v >/dev/null 2>&1; then
	echo 'npm not install yet'
	exit 1
else
	echo 'init node project and typescript'
	npm init -y >/dev/null 2>&1
	npm i --save-dev typescript esbuild obsidian >/dev/null 2>&1
	npx tsc --init >/dev/null 2>&1
fi

if [ ! -d .git ]; then
	echo 'init git repository'
	git init >/dev/null 2>&1
fi

mkdir -p srcs
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/main/srcs/main.ts" > srcs/main.ts 2>/dev/null
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/main/Makefile" > Makefile 2>/dev/null
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/main/.gitignore" > .gitignore 2>/dev/null
curl -L -H "Accept: application/vnd.github.raw+json" "https://raw.githubusercontent.com/knakto/Obsidian-plugin-template/main/manifest.json" > manifest.json 2>/dev/null
