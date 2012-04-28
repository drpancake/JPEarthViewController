
#import "JPEarthViewController.h"

@implementation JPEarthViewController

@synthesize webView;

- (void)loadView
{
    webView = [[WebView alloc] initWithFrame:CGRectZero];
    self.webView.frameLoadDelegate = self;
    
    // Enable plugins
    WebPreferences *prefs = webView.preferences;
    [prefs setPlugInsEnabled:YES];
    
    // Google's JS API for the GE plugin does some user-agent sniffing - make it think we're Safari
    [webView setCustomUserAgent:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 "
                                 "(KHTML, like Gecko) Version/5.1.5 Safari/534.55.3"];
    
    self.view = self.webView;
    
    // Navigate to 'earth.html'
    WebFrame *webFrame = [self.webView mainFrame];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"earth" ofType:@"html"];
    [webFrame loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

- (void)panX:(double)x y:(double)y
{
    NSString *js = [NSString stringWithFormat:@"pan(%f, %f);", x, y];
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

#pragma mark -
#pragma mark WebFrameLoadDelegate (informal)

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    NSLog(@"didFinishLoad");
}

@end
