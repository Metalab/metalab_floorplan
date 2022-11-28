TARGETS = rettungsplan.png floorplan.png network.png

TARGET_INTERMEDIATE = $(TARGETS:.png=.svg)

TARGETSF = $(addprefix export/, ${TARGETS})

all: checks rettungsplan.svg floorplan.svg network.svg

checks:
	[ -d export ] || mkdir export

rettungsplan.svg: Grundriss.svg
	cp $< $@
	inkscape --batch-process --actions="select-by-id:layer1; delete-selection; select-by-id:layer4;	delete-selection; select-by-id:layer3; delete-selection; export-filename:export/rettungsplan.png; export-do;" $@
	rm $@

floorplan.svg: Grundriss.svg
	cp $< $@ 
	inkscape --batch-process --actions="select:layer5; delete; select:layer6; delete; select:layer3; delete; select:layer8; delete; select:layer9; delete; export-filename:export/floorplan.png; export-do;" $@
	rm $@

network.svg: Grundriss.svg
	cp $< $@ 
	inkscape --batch-process --actions="select:layer5; delete; select:layer6; delete; select:layer8; delete; select:layer9; delete; export-filename:export/network.png; export-do" $@
	rm $@

clean: 
	rm -f ${TARGET_INTERMEDIATE} ${TARGETSF}
