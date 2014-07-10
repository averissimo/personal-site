COFFEEC = coffee
SASSC = sass

.PHONY: all
all: styles scripts

# Build app package
APPSRC = src/script.coffee
OUTDIR = lib
APPOUT = ${OUTDIR}/script.js

$(APPOUT): $(APPSRC)
	$(COFFEEC) -o ${OUTDIR} -bc $<

.PHONY: scripts
scripts: $(APPOUT)

# Build stylesheets
STYLESRC = src/style.sass
STYLEOUT = ${OUTDIR}/style.css

$(STYLEOUT): $(STYLESRC)
	$(SASSC) -C --scss $< > $@

.PHONY: styles
styles: $(STYLEOUT)

clean:
	-rm $(APPOUT)
	-rm $(STYLEOUT)

