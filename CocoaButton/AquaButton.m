#import "AquaButton.h"
#import <QuartzCore/QuartzCore.h>
@implementation AquaButton
{
    BOOL isPressed;
}
- (void)awakeFromNib
{
    self.wantsLayer = YES;
}
- (BOOL)wantsUpdateLayer
{
    return YES;
}
- (void)updateLayer
{
    self.layer.contents = [NSImage imageNamed:@"aquabutton.png"];
    if(isPressed)
    {
        CIFilter *darkness = [CIFilter filterWithName:@"CIColorControls"];
        [darkness setDefaults];
        [darkness setValue:@-0.1 forKey:@"inputBrightness"];
        [darkness setValue:@0.5 forKey:@"inputSaturation"];
        self.layer.filters = @[darkness];
    }
    else
    {
        self.layer.filters = nil;
    }
    self.layer.contentsCenter = CGRectMake(0.5f, 0.5f, 1e-5, 1e-5);
}
- (void)mouseDown:(NSEvent *)theEvent
{
    isPressed = YES;
    [self setNeedsDisplay:YES];
}
- (void)mouseUp:(NSEvent *)theEvent
{
    isPressed = NO;
    [self setNeedsDisplay:YES];
    
    if(self.onButtonPushed)
    {
        NSPoint upPoint = [self.superview convertPoint:theEvent.locationInWindow fromView:nil];
        if([self hitTest:upPoint])
        {
            self.onButtonPushed(self);
        }
    }
}
@end
