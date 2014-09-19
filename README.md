Personal Site
=============

## Motivation

My supervisor was insisting I had to create my personal site, but it was a pain to maintain her own. It was written in pure html and required some skills and time to update.

I didn't want that, neither a big framework to create the page, nor writing pure html. So I simplifly and use files that contain all the content and let the framework worry with the look and structure.

## Description of Solution

Uses configuration files that keep all the information.

- A [YAML](http://en.wikipedia.org/wiki/YAML) file keeps the personal and career information (see below for a snippet)
- A [Markdown](http://en.wikipedia.org/wiki/Markdown) file keeps a longer description that can be formated using [Markdown Syntax](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
- Several JSON files to keep the publication record.

*note:* I recommend using Zotero to export the publications directly as *CLS JSON*

[Example site](http://web.tecnico.ulisboa.pt/andre.verissimo)

## Requirements:

- [markdown-js](https://github.com/evilstreak/markdown-js)
- [pure](https://github.com/pure/pure)

## Necessary files:

1. Info.yaml - YAML file with the personal information
1. description.md - Markdown file with description

*(files should be located in data folder)*

## Other Necessary files
These can be generated using [Zotero](https://www.zotero.org/)(export as CLS JSON)

1. Journal.json
1. Oral.json
1. Invited.json
1. Poster.json

*(files should be located in data folder)*

Example files can be found at "example-data" folder

## Usage

After getting markdown-js and pure

- Run `make all`
- Open index.html in your browser

### Static version

As a follow up step you can use the generated html and create a static version of the site. In firefox you have to select everything and then open "View Selection Source", otherwise it will show the version with Pure tags.
