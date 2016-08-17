//
//  MainViewController.m
//  JS_OC_URL
//
//  作者:香蕉  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）
//  微信个人账号：hundreda

#import "MainViewController.h"

#import "WKWebViewController.h"
#import "ZSWebViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"主页";
}

- (IBAction)btnClick2:(id)sender {
    WKWebViewController *wkWebVC = [[WKWebViewController alloc] init];
    
//    ZSWebViewController *wkWebVC = [[ZSWebViewController alloc] init];
    [self.navigationController pushViewController:wkWebVC animated:YES];
}

@end
