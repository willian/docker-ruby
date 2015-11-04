# `adocker` is alias to `azk docker`
all:
	# latest
	adocker build -t willian/ruby:2.2-node12-qt          ./2.2-node12-qt

--no-cache:
	# latest
	adocker build --rm --no-cache -t willian/ruby:2.2-node12-qt          ./2.2-node12-qt
