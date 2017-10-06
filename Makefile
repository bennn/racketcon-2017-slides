TALK=how-to-contribute.rkt

all: show

compile:
	raco make -v ${TALK}

preview: compile
	slideshow --right-half-screen ${TALK}

test: compile
	raco test ${TALK}

show: compile
	slideshow ${TALK}

pdf: compile
	slideshow --condense --pdf ${TALK}

