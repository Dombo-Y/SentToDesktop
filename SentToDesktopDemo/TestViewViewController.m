//
//  TestViewViewController.m
//  SentToTheDesktopDemo
//
//  Created by 尹东博 on 16/2/23.
//  Copyright © 2016年 尹东博. All rights reserved.
//

#import "TestViewViewController.h"

@interface TestViewViewController ()

@end

@implementation TestViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([self.typeStr isEqualToString:@"红色"]) {
        self.view.backgroundColor = [UIColor redColor];
    }else if ([self.typeStr isEqualToString:@"黄色"]){
        self.view.backgroundColor = [UIColor yellowColor];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
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
