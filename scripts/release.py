import os
import sys
import plistlib

with open("release/.version") as f:
	current_version = int(f.read().strip())

next_version = current_version + 1

print "Building release {0} -> {1}".format(current_version, next_version)

plist_path = "build/Release/SoundCloud.app/Contents/Info.plist"
plist = plistlib.readPlist(plist_path)
plist["CFBundleShortVersionString"] = str(next_version) + ".0.0"
plist["CFBundleVersion"] = str(next_version) + ".0.0"
plistlib.writePlist(plist, plist_path)

os.system("cd build/Release; zip -r SoundCloud.zip --symlinks SoundCloud.app")
os.system("mv build/Release/SoundCloud.zip release/SoundCloud.zip".format(next_version))

with open("release/.version", "w") as f:
	f.write(str(next_version))