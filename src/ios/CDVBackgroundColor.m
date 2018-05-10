#import <Cordova/CDV.h>
#import "CDVBackgroundColor.h"

@implementation CDVBackgroundColor

- (void)pluginInitialize {

    NSString *backgroundColorString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CDVCustomBackgroundColor"];
    UIColor *backgroundColor = [self colorFromHexString:backgroundColorString];

    self.webView.backgroundColor = backgroundColor;
    self.viewController.view.backgroundColor = backgroundColor;
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
