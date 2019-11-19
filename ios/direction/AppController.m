
+(void)setOrientation:(bool)bIsPortrait{
    UIInterfaceOrientation interfaceOrientation = UIInterfaceOrientationUnknown;
    if(bIsPortrait){
        interfaceOrientation =UIInterfaceOrientationPortrait;
    }
    else{
        interfaceOrientation =UIInterfaceOrientationLandscapeRight;
    }
    //NSLog(@"%d,setOrientation",bIsPortrait);
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

- (void) openWeb: (NSString*) urlStr
{
    if (webview == nullptr) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.allowsInlineMediaPlayback = YES;
        config.mediaPlaybackRequiresUserAction = false;
//        [config.userContentController addScriptMessageHandler:(id<WKScriptMessageHandler>)self name:@"setOrientation"];
        
        webview = [[WKWebView alloc] initWithFrame:window.bounds configuration:config];
        webview.backgroundColor=[UIColor whiteColor];
        
//        webview.layer.bounds = CGRectMake(0, 0, webview.layer.bounds.size.height, webview.layer.bounds.size.width);
//        webview.frame.size = CGSizeMake();
        // warning: addSubView only work on iOS11.0 or newer
        if (@available(iOS 11.0, *)) {
//            [config setURLSchemeHandler:[CustomURLSchemeHandler new] forURLScheme:@"game"];
            webview.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [window addSubview:webview];
        NSLog(@"create new webview.");
    } else {
        [webview setHidden:false];
    }
    
    // 加载页面，self.urlString是网址
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    
//    [PlatBridge setPortrait:true];
//    auto widht = webview.layer.bounds.size.width;
//    auto height = webview.layer.bounds.size.height;
//    NSLog(@"width: %f height: %f", widht, height);
//    webview.layer.bounds = CGRectMake(widht / 2, height / 2, webview.layer.bounds.size.height, webview.layer.bounds.size.width);
//    webview.layer.position = CGPointMake(widht, height);
}