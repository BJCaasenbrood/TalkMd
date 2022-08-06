SOURCE=talk
MD_EXTENSION=md
OUTPUT=talk
LANGUAGE=us
SETTINGS_FILE='settings.tex'
# Options are pygments (the default), kate, monochrome, espresso, zenburn, haddock, and tango
HIGHLIGHT=zenburn
# Font specs
MAINFONT='DejaVu Sans'
SANSFONT='PT Sans'
MONOFONT='DejaVu Sans Mono'

default:
	@echo "Compiling presentation..."
	@pandoc -t beamer --pdf-engine=lualatex  --highlight-style=${HIGHLIGHT} -H ${SETTINGS_FILE} -V theme:m -o ${OUTPUT}.pdf ${SOURCE}.${MD_EXTENSION}  --highlight-style highlight.theme
	@python3 cleanup.py
	@echo "All done!"
	
#default:
# @pandoc -t beamer --pdf-engine=xelatex --highlight-style=${HIGHLIGHT} -H ${SETTINGS_FILE} -V mainfont=${MAINFONT} -V sansfont=${SANSFONT} -V monofont=${MONOFONT} -V lang=${LANGUAGE} -V theme:m -o ${OUTPUT}.pdf ${SOURCE}.${MD_EXTENSION}
#	@pandoc -t beamer -s --pdf-engine=xelatex --highlight-style=${HIGHLIGHT} -H ${SETTINGS_FILE} -V mainfont=${MAINFONT} -V sansfont=${SANSFONT} -V monofont=${MONOFONT} -V lang=${LANGUAGE} -V theme:m -o ${OUTPUT}.tex ${SOURCE}.${MD_EXTENSION}
#	@echo "All done!"
#	@open ${OUTPUT}.pdf
