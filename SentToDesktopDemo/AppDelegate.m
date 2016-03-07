//
//  AppDelegate.m
//  SentToTheDesktopDemo
//
//  Created by 尹东博 on 16/2/23.
//  Copyright © 2016年 尹东博. All rights reserved.
//


#warning 如果遇见libxml 文件找不到
/*解决方案
 http://blog.csdn.net/cloudhsu/article/details/8087628
 */

#import "AppDelegate.h"
#import "TestViewViewController.h"
@interface AppDelegate (){
    RoutingHTTPServer * _httpServer;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation{
    NSString * urlString = url.absoluteString;
    
    if ([urlString hasPrefix:@"BusterMark://"]) {
        NSArray * separateArray = [urlString componentsSeparatedByString:@"BusterMark://"];
        
        NSString * openURLStr = [separateArray objectAtIndex:1];
        
        if ([openURLStr hasPrefix:@"red"]) {
            //跳转服务账号界面
            NSArray * sendServerTag = [openURLStr componentsSeparatedByString:@"red"];
            Class class = NSClassFromString(@"TestViewViewController");
            if (class) {
                TestViewViewController *ctrl = class.new;
                ctrl.title =@"红色";
                ctrl.typeStr = @"红色";
                [self.window.rootViewController presentViewController:ctrl animated:YES completion:nil];
            }
        }
        return NO;
    }
    
    if ([urlString hasPrefix:@"bustermark://"]) {
        NSArray * separateArray = [urlString componentsSeparatedByString:@"bustermark://"];
        
        NSString * openURLStr = [separateArray objectAtIndex:1];
        
        if ([openURLStr hasPrefix:@"red"]) {
            //跳转服务账号界面
            NSArray * sendServerTag = [openURLStr componentsSeparatedByString:@"red"];
            NSString * VCStr = sendServerTag[1];
            Class class = NSClassFromString(VCStr);
            if (class) {
                TestViewViewController *ctrl = class.new;
                ctrl.title =@"红色";
                ctrl.typeStr = @"红色";
                [self.window.rootViewController presentViewController:ctrl animated:YES completion:nil];
            }
        }
        return NO;
    }
    return  nil;
}




#pragma mark - SafariOpen
- (void)startServer {
    _httpServer = [[RoutingHTTPServer alloc] init];
    [_httpServer setType:@"_http._tcp."];
    [_httpServer setPort:[self getRandomNum:5]];
    NSString * documentsDirectory =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    [_httpServer setDocumentRoot:documentsDirectory];
    NSError * error;
    if ([_httpServer start:&error]) {
        NSLog(@"Started HTTP Server on port");
    }else{
        NSLog(@"Error starting HTTP Server :%@",error);
    }
}

-(NSInteger)getRandomNum:(NSInteger )idCount{
    NSArray *array=[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    NSMutableString *messageID=[NSMutableString stringWithString:@""];
    for (int i=0; i<idCount; i++) {
        int value = arc4random()%[array count];
        [messageID appendString:[array objectAtIndex:value]];
    }
    return [messageID integerValue];
}
@end
