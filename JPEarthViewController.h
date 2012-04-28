
#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface JPEarthViewController : NSViewController

- (void)panX:(double)x y:(double)y;

@property (nonatomic, strong, readonly) WebView *webView;

@end