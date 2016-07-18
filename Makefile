.DEFAULT_GOAL := build
.PHONY: build release

build:
	xcodebuild

release: build
	python scripts/release.py
