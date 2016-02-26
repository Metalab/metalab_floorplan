all: rettungsplan.png floorplan.png network.png
	rm rettungsplan.svg floorplan.svg network.svg


rettungsplan.svg: Grundriss.svg
	cp $< $@ 
	# TODO this will open up the gui...
	inkscape $@ \
		--select=layer1 --verb=EditDelete \
		--select=layer4 --verb=EditDelete \
		--select=layer3 --verb=EditDelete \
		--verb=FileSave --verb=FileClose --verb=FileQuit

floorplan.svg: Grundriss.svg
	cp $< $@ 
	# TODO this will open up the gui...
	inkscape $@ \
		--select=layer5 --verb=EditDelete \
		--select=layer6 --verb=EditDelete \
		--select=layer3 --verb=EditDelete \
		--verb=FileSave --verb=FileClose --verb=FileQuit

network.svg: Grundriss.svg
	cp $< $@ 
	# TODO this will open up the gui...
	inkscape $@ \
		--select=layer5 --verb=EditDelete \
		--select=layer6 --verb=EditDelete \
		--verb=FileSave --verb=FileClose --verb=FileQuit

floorplan.png: floorplan.svg
	inkscape $< --export-png=$@ --export-dpi=300 --export-area-drawing

network.png: network.svg
	inkscape $< --export-png=$@ --export-dpi=300 --export-area-drawing

%.png: %.svg
	inkscape $< --export-png=$@ --export-dpi=300

%.pdf: %.svg
	inkscape $< --export-pdf=$@ --export-dpi=300

