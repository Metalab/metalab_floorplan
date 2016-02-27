TARGETS = rettungsplan.png floorplan.png network.png

TARGET_INTERMEDIATE = $(TARGETS:.png=.svg)

TARGETSF = $(addprefix export/, ${TARGETS})


all: checks ${TARGETSF}
	rm ${TARGET_INTERMEDIATE}

checks:
	[ -d export ] || mkdir export

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
		--select=layer8 --verb=EditDelete \
		--verb=FileSave --verb=FileClose --verb=FileQuit

network.svg: Grundriss.svg
	cp $< $@ 
	# TODO this will open up the gui...
	inkscape $@ \
		--select=layer5 --verb=EditDelete \
		--select=layer6 --verb=EditDelete \
		--select=layer8 --verb=EditDelete \
		--verb=FileSave --verb=FileClose --verb=FileQuit

export/floorplan.png: floorplan.svg
	inkscape $< --export-png=$@ --export-dpi=300 --export-area-drawing

export/network.png: network.svg
	inkscape $< --export-png=$@ --export-dpi=300 --export-area-drawing

export/%.png: %.svg
	inkscape $< --export-png=$@ --export-dpi=300

%.pdf: %.svg
	inkscape $< --export-pdf=$@ --export-dpi=300

