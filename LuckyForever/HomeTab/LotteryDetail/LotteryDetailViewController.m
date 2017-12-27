//
//  LotteryDetailViewController.m
//  一路发
//
//  Created by 姚远 on 12/12/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "LotteryDetailViewController.h"

@interface LotteryDetailViewController ()

@end

@implementation LotteryDetailViewController{
    DRPLoadingSpinner *spinner;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.navigationDelegate = self;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    spinner = [[DRPLoadingSpinner alloc] initWithFrame:CGRectMake((screenRect.size.width/2)-25, (screenRect.size.height/2)-25, 50, 50)];
    [self.view addSubview:spinner];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.strURL]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonButtonPushed:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    [spinner stopAnimating];
    
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //NSLog(@"FINISH");
    
    
}
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //NSLog(@"START");
    [spinner startAnimating];
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
