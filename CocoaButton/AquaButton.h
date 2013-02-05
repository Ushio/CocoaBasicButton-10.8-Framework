#import <Cocoa/Cocoa.h>

@interface AquaButton : NSView
@property (nonatomic, copy) void (^onButtonPushed)(AquaButton *me);
@end
