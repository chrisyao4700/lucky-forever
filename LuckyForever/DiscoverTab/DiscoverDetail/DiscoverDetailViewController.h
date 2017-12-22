//
//  DiscoverDetailViewController.h
//  一路发
//
//  Created by 姚远 on 12/13/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "DRPLoadingSpinner.h"
@interface DiscoverDetailViewController : UIViewController<WKNavigationDelegate>
@property (strong, nonatomic) IBOutlet WKWebView *webView;
@property NSString * strURL;
@end
