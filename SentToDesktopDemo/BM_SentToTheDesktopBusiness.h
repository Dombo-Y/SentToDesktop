//
//  BM_SentToTheDesktopBusiness.h
//  SentToTheDesktopDemo
//
//  Created by 尹东博 on 16/2/23.
//  Copyright © 2016年 尹东博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BM_SentToTheDesktopBusiness : NSObject



/*!
 @abstract 桌面建立快捷方式
 @function sendDesktopGetName:(NSString*)name GetIconStr:(NSString*)iconStr GetVCID:(NSString*)VCid OpenUrlStr:(NSString*)OpenUrlstr；
 @param 需要传送
 (NSString*)name 名称
 (NSString*)iconStr 图标链接
 (NSString*)VCid VCID
 (NSString*)openUrlStr OpenUrl标识字符串
 */
-(void)sendDesktopGetName:(NSString*)name GetIconStr:(NSString*)iconStr GetVCID:(NSString*)VCid OpenUrlStr:(NSString*)OpenUrlstr;
@end
