rettungsplan.svg: Grundriss.svg
	# TODO this will open up the gui...
	cp Grundriss.svg rettungsplan.svg
	inkscape $@ \
		--select=layer1 --verb=EditDelete \
		--select=layer4 --verb=EditDelete \
		--select=layer3 --verb=EditDelete \
		--verb=FileSave --verb=FileClose

%.png: %.svg
	inkscape $< --export-png=$@ --export-dpi=300

%.pdf: %.svg
	inkscape $< --export-pdf=$@ --export-dpi=300


all: rettungsplan.png
