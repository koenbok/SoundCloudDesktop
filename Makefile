.DEFAULT_GOAL := build
.PHONY: build release

build:
	xcodebuild clean
	xcodebuild -configuration Release

release:
	python scripts/release.py
	open release
