//
//  SCApplication.m
//  SoundCloud
//
//  Created by Koen Bok on 18/07/16.
//  Copyright © 2016 Koen Bok. All rights reserved.
//

#import "SCApplication.h"
#import "AppDelegate.h"

@implementation SCApplication

- (void)sendEvent: (NSEvent*)event
{
    if( [event type] == NSSystemDefined && [event subtype] == 8 )
    {
        int keyCode = (([event data1] & 0xFFFF0000) >> 16);
        int keyFlags = ([event data1] & 0x0000FFFF);
        int keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA;
        int keyRepeat = (keyFlags & 0x1);
        
        [self mediaKeyEvent:keyCode state:keyState repeat:keyRepeat];
        
        return;
    }
    
    [super sendEvent: event];
}

- (void)mediaKeyEvent: (int)key state: (BOOL)state repeat: (BOOL)repeat
{
    
    AppDelegate *delegate = self.delegate;
    
    switch( key )
    {
        case NX_KEYTYPE_PLAY:
            if( state == 0 )
                [delegate play:self];
                ; //Play pressed and released
            break;
            
        case NX_KEYTYPE_FAST:
            if( state == 0 )
                [delegate forward:self];
                ; //Next pressed and released
            break;
            
        case NX_KEYTYPE_REWIND:
            if( state == 0 )
                [delegate backward:self];
                ; //Previous pressed and released
            break;
    }
}

@end
