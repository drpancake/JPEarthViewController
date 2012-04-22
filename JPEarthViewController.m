
#import "JPEarthViewController.h"

@implementation JPEarthViewController

@synthesize webView;

- (void)loadView
{
    webView = [[WebView alloc] initWithFrame:CGRectZero];
    self.webView.frameLoadDelegate = self;
    self.view = self.webView;
}

#pragma mark -
#pragma mark WebFrameLoadDelegate (informal)

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    NSLog(@"didFinishLoad");
}

@end
