//
//  ViewController.m
//  SentToTheDesktopDemo
//
//  Created by 尹东博 on 16/2/23.
//  Copyright © 2016年 尹东博. All rights reserved.
//

#import "ViewController.h"
#import "TestViewViewController.h"
#import "BM_SentToTheDesktopBusiness.h"
@interface ViewController ()

@end

@implementation ViewController

#warning 如果遇见libxml 文件找不到
/*解决方案
 http://blog.csdn.net/cloudhsu/article/details/8087628
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToFristVC:(UIButton *)sender {
    Class class = NSClassFromString(@"TestViewViewController");
    if (class) {
        TestViewViewController *ctrl = class.new;
        ctrl.title =@"红色";
        ctrl.typeStr = @"红色";
        [self presentViewController:ctrl animated:YES completion:nil];
    }
}
- (IBAction)goToSecondVC:(UIButton *)sender {
    BM_SentToTheDesktopBusiness  * sentToDesktopBusiness = [[BM_SentToTheDesktopBusiness alloc] init];
    [sentToDesktopBusiness sendDesktopGetName:@"名字" GetIconStr:@"http://e.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=0dd86256642762d09433acedc185639f/ae51f3deb48f8c5430da185a3d292df5e0fe7fbe.jpg" GetVCID:@"TestViewViewController" OpenUrlStr:@"red"];
}

@end
