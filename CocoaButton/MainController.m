#import "MainController.h"

#import "AquaButton.h"
@implementation MainController
{
    IBOutlet AquaButton *button;
}
- (void)awakeFromNib
{
    button.onButtonPushed = ^(AquaButton *me)
    {
        NSLog(@"onButtonPushed!");
    };
}
@end
