#import <Cordova/CDV.h>
#import "CDVBackgroundColor.h"

@implementation CDVBackgroundColor

- (void)pluginInitialize
{
    NSString *backgroundColorString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CDVCustomBackgroundColor"];

    UIColor *backgroundColor = [UIColor colorFromHex:backgroundColorString];

    self.webView.opaque=NO;
    self.webView.backgroundColor = backgroundColor;
}

@end

@implementation UIColor (Hex)

+ (UIColor*)colorFromHex:(NSString *)hex
{
    unsigned result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];

    [scanner setScanLocation:0];
    [scanner scanHexInt:&result];

    return UIColorFromRGB(result);
}

@end
