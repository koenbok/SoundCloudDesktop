.DEFAULT_GOAL := build
.PHONY: build release

build:
	xcodebuild

release:
	python scripts/release.py
	open release
