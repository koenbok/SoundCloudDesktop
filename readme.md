![SoundCloud](https://cl.ly/2t2K250o153r/Image%202016-07-18%20at%209.19.51%20PM.png)


You can [download the latest version here](https://github.com/koenbok/SoundCloudDesktop/raw/master/release/SoundCloud.zip).

### SoundCloud Desktop

This is a super simple desktop wrapper for SoundCloud. It's nice to have it running in a separate app so you have it around and don't accidentaly close it. 

#### Features:

- It saves your url on quit and re-opens at that page.
- It works with the media keys on your keyboard.

#### Notes

- Facebook logins don't work, sorry. You can easily add a password and use that to login under your profile in your normal browser.
- If iTunes keeps launching when you press the play button paste this in a terminal: `launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist`.
- It is somewhat based on [soundcleod](https://github.com/salomvary/soundcleod) but for some reason it stopped playing after a minute or so, and it was faster to rebuild than debug.
- SoundCloud, don't sue me I love you. And please make a nice desktop app. A web app is fine.
