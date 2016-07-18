//
//  AppDelegate.h
//  SoundCloud
//
//  Created by Koen Bok on 18/07/16.
//  Copyright © 2016 Koen Bok. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

- (IBAction)play:(id)sender;
- (IBAction)forward:(id)sender;
- (IBAction)backward:(id)sender;

@end

