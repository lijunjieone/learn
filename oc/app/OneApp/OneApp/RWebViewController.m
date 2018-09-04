//
//  RWebViewController.m
//  OneApp
//
//  Created by lijunjie on 04/09/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RWebViewController.h"

@interface RWebViewController ()


@end

@implementation RWebViewController

-(void) loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

-(void) setUrl:(NSURL *)url {
    _url = url;
    if(_url) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_url];
        [(UIWebView *)self.view loadRequest:req];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
