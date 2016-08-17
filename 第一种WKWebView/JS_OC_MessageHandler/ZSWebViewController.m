//
//  ZSWebViewController.m
//  JS_OC_MessageHandler
//
//  作者:香蕉  简书地址：http://www.jianshu.com/users/a3ae6d7c68b6/latest_articles
//  微信个人技术公众号：大大家的IOS说（一起用碎片时间学习最新最有用的IOS资料）
//  微信个人账号：hundreda

#import "ZSWebViewController.h"
@interface ZSWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic)   UIWebView                   *webView;
@property (strong, nonatomic)   UIProgressView              *progressView;

@end
@implementation ZSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //头部
    self.title = @"MessageHandler";
    //右边
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self initWKWebView];
    
    
}

//初始化页面
- (void)initWKWebView
{
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    //    NSString *urlStr = @"http://www.baidu.com";
    //    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    //    [self.webView loadRequest:request];
    
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"index.html" ofType:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    
    
}


#pragma mark delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //这种方法是直接执行,不能达到点击里面按钮,修改JS
    NSString *jsCode = [NSString stringWithFormat:@"payResult('%@')",@"支付成功"];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *requestString = [[request URL] absoluteString];
    NSLog(@"%@",requestString);
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    
    NSLog(@"%@",components);

    if (![(NSString *)[components objectAtIndex:0] isEqualToString:@"file"]) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"提示" message:requestString
                              delegate:self cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    return YES;
}


@end
