import { Plugin } from "obsidian";

export default class Obsgit extends Plugin
{
	async onload() {
		Notice("Hello, World!");
	}
}
