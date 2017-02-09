//
//  AppDelegate.m
//  SoundCloud
//
//  Created by Koen Bok on 18/07/16.
//  Copyright © 2016 Koen Bok. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property WKWebView *webView;
@end

static NSString *MainWindowURLKey = @"MainWindowURLKey";
static NSString *JSKeyTemplate = @"e=new Event('keydown');e.keyCode=%d;document.dispatchEvent(e);e=new Event('keyup');e.keyCode=32;document.dispatchEvent(e)";

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{MainWindowURLKey:@"https://www.mixcloud.com"}];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.window.contentView.bounds configuration:config];
    
    self.webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.window.contentView addSubview:self.webView];
    
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:MainWindowURLKey];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [[NSUserDefaults standardUserDefaults] setObject:self.webView.URL.absoluteString forKey:MainWindowURLKey];
}
- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
{
    if (flag) {
        return NO;
    } else {
        [self.window makeKeyAndOrderFront:self];
        return YES;
    }
}

- (IBAction)play:(id)sender {
    NSLog(@"play");
    [self trigger:32];
}
- (IBAction)forward:(id)sender {
    NSLog(@"forward");
    [self trigger:74];
}
- (IBAction)backward:(id)sender {
    NSLog(@"backward");
    [self trigger:75];
}

- (void)trigger:(NSInteger)keyCode {
    NSString *js = [NSString stringWithFormat:JSKeyTemplate, (NSInteger)keyCode];
    [self.webView evaluateJavaScript:js completionHandler:nil];
}

- (IBAction)goTo:(NSMenuItem*)sender {
    
    NSString *url;
    
    switch (sender.tag) {
        case 0:
            url = @"https://soundcloud.com/";
            break;
        case 1:
            url = @"https://mixcloud.com/";
            break;
            
        default:
            return;
    }
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
