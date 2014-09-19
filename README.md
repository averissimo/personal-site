Personal Site
=============

[Example](http://web.tecnico.ulisboa.pt/andre.verissimo)

## Requirements:

- [markdown-js](https://github.com/evilstreak/markdown-js)
- [pure](https://github.com/pure/pure)

## Necessary files:

1. data/Info.yaml - YAML file with the personal information
1. data/description.md - markdown with description

## Other Necessary files
These can be generated using [Zotero](https://www.zotero.org/)(export as CLS JSON)

1. data/Journal.json - Export from Zotero CSL JSON
1. data/Oral.json - Export from Zotero CSL JSON
1. data/Invited.json - Export from Zotero CSL JSON
1. data/Poster.json - Export from Zotero CSL JSON

Example files can be found at "example-data" folder

## Usage

After getting markdown-js and pure

- Run `make all`
- Open index.html in your browser

### Static version

As a follow up step you can use the generated html and create a static version of the site. In firefox you have to select everything and then open "View Selection Source", otherwise it will show the version with Pure tags.
