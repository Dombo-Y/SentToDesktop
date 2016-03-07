//
//  AppDelegate.h
//  SentToTheDesktopDemo
//
//  Created by 尹东博 on 16/2/23.
//  Copyright © 2016年 尹东博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutingHTTPServer.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly,nonatomic)RoutingHTTPServer * httpServer;


- (void)startServer;    //startHttpServer 开启http服务
@end

